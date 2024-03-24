import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:lru_cache/lru_cache.dart';
import 'package:rxdart/rxdart.dart';

import '/data.dart';
import '/logging.dart';
import 'api_client.dart';

typedef CacheId = (Type type, int id);

extension type RefsCounter<T extends Object>._(Expando<int> _refsCount) {
  factory RefsCounter() => RefsCounter._(Expando());

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int _changeRefsCount(T object, int diff) =>
    _refsCount[object] = getCurrent(object) + diff;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int getCurrent(T object) => _refsCount[object] ?? 0;

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int operator+(T object) => increase(object);
  
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int operator-(T object) => decrease(object);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int increase(T object) => _changeRefsCount(object, 1);

  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  int decrease(T object) => _changeRefsCount(object, -1);
}

extension type CacheDates<T extends Object>._(Expando<DateTime> _cacheDate) {
  factory CacheDates() => CacheDates._(Expando());

  static final _zeroTime = DateTime.fromMillisecondsSinceEpoch(0);

  DateTime get(T object) => _cacheDate[object] ?? _zeroTime;
  void update(T object) => _cacheDate[object] = DateTime.now();
  void reset(T object) => _cacheDate[object] = null;
}

class ApiRepository {
  ApiRepository({
    required this.client,
  });

  static const cacheValidity = Duration(seconds: 1);

  final ApiClient client;

  final cache = LruWeakCache<CacheId, Object>(10);
  final cacheDates = CacheDates(); 
  final controllers = <CacheId, BehaviorSubject<Object>>{};
  final controllersListenersCounter = RefsCounter<BehaviorSubject<Object>>();
  final requestsLocks = <CacheId, Future<void>>{};

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
                  await _removeUnusedController(subject, id);
                return subscription.cancel();
              };
          };
          return controller.stream.listen(null);
        },
      ),
    );
  
  Future<void> _removeUnusedController<T extends Object>(BehaviorSubject<T> controller, CacheId id) async {
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

  Uri getAssetUri(int assetId) => client.getAssetUri(assetId);

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

  Future<List<FeedItem>> getFeed(int offset, int limit, FeedType type) =>
      client.getFeed(offset, limit, type);
}
