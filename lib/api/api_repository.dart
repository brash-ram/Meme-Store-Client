import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:lru_cache/lru_cache.dart';
import 'package:rxdart/rxdart.dart';

import '/data.dart';
import '/logging.dart';
import 'api_client.dart';
import 'cache_dates.dart';
import 'refs_counter.dart';


typedef CacheId = (Type type, int id);

class ApiRepository {
  ApiRepository({
    required this.client,
  });

  static final _random = math.Random(1337);

  static const cacheValidity = Duration(seconds: 1);
  static const useDelayedRemoval = true;

  final ApiClient client;

  final cache = LruWeakCache<CacheId, Object>(10);
  final cacheDates = CacheDates(); 
  final controllers = <CacheId, BehaviorSubject<Object>>{};
  final controllersListenersCounter = RefsCounter<BehaviorSubject<Object>>();
  final requestsLocks = <CacheId, Future<void>>{};
  // Delayed removals offset cleanup work at some near future time
  final delayedRemovals = Expando<Timer>();

  Stream<T> _prepareDataStream<T extends Object>(BehaviorSubject<T> subject, CacheId id) =>
    subject.stream.transform(
      StreamTransformer(
        (stream, cancelOnError) {
          final controller = StreamController<T>(sync: true);
          controller.onListen = () {
            controllersListenersCounter.increase(subject);
            final subscription = stream.listen(
              controller.add,
              onError: controller.addError,
              onDone: controller.close,
              cancelOnError: cancelOnError,
            );
            controller
              ..onPause = subscription.pause
              ..onResume = subscription.resume
              ..onCancel = () async {
                if (controllersListenersCounter.decrease(subject) == 0)
                  await _scheduleRemoveUnusedController(subject, id);
                return subscription.cancel();
              };
          };
          return controller.stream.listen(null);
        },
      ),
    );
  
  FutureOr<void> _scheduleRemoveUnusedController<T extends Object>(BehaviorSubject<T> controller, CacheId id) {
    if (!useDelayedRemoval)
      return _removeUnusedController(controller, id);

    if (delayedRemovals[controller] != null)
      return null;

    final delay = Duration(milliseconds: 800 + _random.nextInt(200));
    delayedRemovals[controller] = Timer(
      delay,
      () async => _removeUnusedController(controller, id),
    );
  }

  Future<void> _removeUnusedController<T extends Object>(BehaviorSubject<T> controller, CacheId id) async {
    if (useDelayedRemoval) {
      // check if removal is canceled
      if (delayedRemovals[controller] == null)
        return;

      delayedRemovals[controller] = null;
    }
    assert(controllers[id] == controller, 'Requested removal of unknown controller.');
    if (controllers[id] == controller)
      controllers.remove(id);
    talker.verbose('ApiRepository: Removed controller with id $id');

    assert(!controller.isClosed, 'Requested removal of already closed controller.');
    await controller.close();
  }

  /// Creates data stream from wrapped fetch call.
  Stream<T> _createDataStream<T extends Object>(
    Future<void> Function(int id) wrappedFetchCall,
    int id,
  ) {
    final cacheId = (T, id);
    final controller = controllers.putIfAbsent(
      cacheId,
      () {
        talker.verbose('ApiRepository: Created controller with id $id');
        return BehaviorSubject<T>();
      },
    ) as BehaviorSubject<T>;
    if (useDelayedRemoval) {
      delayedRemovals[controller]?.cancel();
      delayedRemovals[controller] = null;
    }

    final cached = cache[cacheId] as T?;
    if (kDebugMode && cached != null && controller.hasValue)
      assert(controller.valueOrNull == cached, 'Cached value diverges with controller cache');

    if (cached == null || DateTime.now().difference(cacheDates.get(cached)) > cacheValidity) {
      unawaited(wrappedFetchCall.call(id));
    } else if (!controller.hasValue) {
      controller.add(cached);
    }

    return _prepareDataStream(controller, cacheId);
  }

  /// Wraps request call.
  /// Wrapped call doesn't return data, but instead updates corresponding data
  /// stream.
  Future<void> _wrapFetchCall<T extends Object>(
    Future<T> Function(int id) makeRequest,
    int id,
  ) {
    final cacheId = (T, id);
    return requestsLocks.putIfAbsent(
      cacheId,
      () async {
        try {
          _commitObject(id, await makeRequest(id));
        } catch (error, stackTrace) {
          _commitError<T>(id, error, stackTrace);
        } finally {
          unawaited(requestsLocks.remove(cacheId));
        }
      }
    );
  }

  void _commitObject<T extends Object>(int id, T data) {
    final cacheId = (T, id);
    cache[cacheId] = data;
    cacheDates.update(data);
    if (controllers[cacheId] case final controller?)
      controller.add(data);
  }
  void _commitError<T extends Object>(int id, Object error, [StackTrace? stackTrace]) {
    if (controllers[(T, id)] case final controller?)
      controller.addError(error, stackTrace);
    else
      talker.warning(
        'Error occurred while retrieving data, but target stream have no subscribers',
        error,
        stackTrace,
      );
  }

  Future<void> fetchGallery(int id) =>
    _wrapFetchCall(
      (id) async => client.getGallery(id),
      id,
    );

  Stream<Gallery> getGallery(int id) =>
    _createDataStream(
      (id) async => fetchGallery(id),
      id,
    );

  Future<void> fetchMeme(int galleryId, int memeId) =>
    _wrapFetchCall(
      (id) async => client.getMeme(galleryId, memeId),
      memeId,
      // (galleryId & 0xffff) << 16 | (memeId & 0xffff),
    );

  Stream<Meme> getMeme(int galleryId, int memeId) =>
    _createDataStream(
      (id) async => fetchMeme(galleryId, memeId),
      memeId,
      // (galleryId & 0xffff) << 16 | (memeId & 0xffff),
    );

  Future<void> fetchMemeTags(int galleryId, int memeId) =>
    _wrapFetchCall(
      (id) async => client.getMemeTags(galleryId, memeId),
      memeId,
    );

  Stream<List<MemeTag>> getMemeTags(int galleryId, int memeId) =>
    _createDataStream(
      (id) async => fetchMemeTags(galleryId, memeId),
      memeId,
    );

  Future<void> voteForMemeTag(int galleryId, int memeId, int tagId, VoteType? vote) async {
    try {
      _commitObject(memeId, await client.voteForMemeTag(galleryId, memeId, tagId, vote));
    } catch (error, stackTrace) {
      _commitError<List<MemeTag>>(memeId, error, stackTrace);
      rethrow;
    }
  }

  Future<void> fetchTenant(int id) =>
    _wrapFetchCall(
      (id) async => client.getTenant(id),
      id,
    );

  Stream<Tenant> getTenant(int id) =>
    _createDataStream(
      (id) async => fetchTenant(id),
      id,
    );

  Future<void> fetchMyTenantProfile() =>
    _wrapFetchCall(
      (id) async => client.getMyTenantProfile(),
      -1,
    );

  Stream<TenantProfile> getMyTenantProfile() =>
    _createDataStream(
      (id) async => fetchMyTenantProfile(),
      -1,
    );

  Future<void> fetchTenantProfile(int id) =>
    _wrapFetchCall(
      (id) async => client.getTenantProfile(id),
      id,
    );

  Stream<TenantProfile> getTenantProfile(int id) =>
    _createDataStream(
      (id) async => fetchTenantProfile(id),
      id,
    );

  Future<void> fetchAvailableGalleryNames() =>
    _wrapFetchCall(
      (id) async => client.getAvailableGalleryNames(),
      -1,
    );

  Stream<List<AvailableGalleryName>> getAvailableGalleryNames() =>
    _createDataStream(
      (id) async => fetchAvailableGalleryNames(),
      -1,
    );

  Uri getAssetUri(int assetId) => client.getAssetUri(assetId);

  Future<List<FeedItem>> getFeed(int offset, int limit, FeedType type) =>
    client.getFeed(offset, limit, type);

  Future<AssetTemporaryTicket> uploadAsset(Uint8List data, AssetType type) =>
    client.uploadAsset(data, type);

  Future<Meme> createMeme({
    required RequestBodyCreateMeme meme,
    required AssetTemporaryTicket assetTicket,
    required int galleryId,
  }) async {
    final newMeme = await client.createMeme(
      meme: meme,
      assetTicket: assetTicket,
      galleryId: galleryId,
    );
    _commitObject(newMeme.id, newMeme);
    return newMeme;
  }
}
