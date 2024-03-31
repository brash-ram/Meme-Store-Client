import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '/data.dart';
import '/logging.dart';
import 'api_exception.dart';
import 'auth_controller.dart';


class ApiClient {
  ApiClient({
    required this.baseUri,
    required this.authController,
    required this.client,
  });

  static const kIncludeRequestsInErrors = true;

  final Uri baseUri;
  final AuthController authController;
  final http.Client client;

  Future<ResponseOk<T>> _request<T, B>(
    String path, {
      String method = 'GET',
      Map<String, String> queryParameters = const {},
      Map<String, String> headers = const {},
      B? body,
      Uint8List? bodyBytes,
    }
  ) async {
    final _method = method.toUpperCase();
    assert(body == null || bodyBytes == null, 'Cannot supply both text body and bytes body');
    assert(
      switch(_method) {
        'GET' || 'HEAD' when body != null || bodyBytes != null => false,
        _ => true,
      },
      'Cannot supply body with GET or HEAD methods',
    );
    final request = http.Request(
      _method,
      baseUri.replace(
        path: baseUri.path + path,
        queryParameters: queryParameters,
      ),
    );
    request.headers.addAll(headers);
    authController.authorizeRequest(request);
    if (body != null)
      request.body = MapperContainer.globals.toJson(body);
    if (bodyBytes != null)
      request.bodyBytes = bodyBytes;
  
    final errorDetailsRequest = !kIncludeRequestsInErrors ? null : request;
    final http.Response response;
    try {
      response = await http.Response.fromStream(await client.send(request));
    } on http.ClientException catch(exception) {
      throw ApiException<Never>(
        'Connection error',
        innerException: exception,
        httpRequest: errorDetailsRequest,
      );
    }
    try {
      final data = MapperContainer.globals.fromJson<Response<T>>(response.body);
      switch (data) {
        case ResponseOk():
          return data;
        case ResponseError(:final message, :final code):
          throw ApiException.withResponse(
            'Error $code: $message',
            data,
            httpRequest: errorDetailsRequest,
            httpResponse: response,
          );
        case ResponseInvalid():
          throw ApiException.withResponse(
            'Invalid server response',
            data,
            httpRequest: errorDetailsRequest,
            httpResponse: response,
          );
      }
    } on FormatException catch(exception) {
      throw ApiException<Never>(
        'Invalid server response',
        innerException: exception,
        httpRequest: errorDetailsRequest,
        httpResponse: response,
      );
    } on MapperException catch(exception, stackTrace) {
      talker.verbose('Failed to decode server response.', exception, stackTrace);
      throw ApiException<Never>(
        'Invalid server response',
        innerException: exception,
        httpRequest: errorDetailsRequest,
        httpResponse: response,
      );
    }
  }

  Future<T> _get<T>(String path, {
    Map<String, String> queryParameters = const {},
    Map<String, String> headers = const {},
  }) =>
    _request<T, Never>(
      path,
      queryParameters: queryParameters,
      headers: headers,
    )
    .then((value) => value.result);

  Future<T> _post<T, B>(String path, {
    B? body,
    Map<String, String> queryParameters = const {},
    Map<String, String> headers = const {},
  }) =>
    _request<T, B>(
      path,
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        ...headers,
      },
      queryParameters: queryParameters,
      body: body,
    )
    .then((value) => value.result);

  Future<T> _postBinary<T>(String path, {
    Uint8List? bodyBytes,
    Map<String, String> queryParameters = const {},
    Map<String, String> headers = const {},
  }) =>
    _request<T, Never>(
      path,
      method: 'POST',
      headers: {
        'content-type': 'application/octet-stream',
        ...headers,
      },
      queryParameters: queryParameters,
      bodyBytes: bodyBytes,
    )
    .then((value) => value.result);

  Future<Gallery> getGallery(int id) =>
    _get('/gallery/$id');

  Future<Meme> createMeme({
    required RequestBodyCreateMeme meme,
    required AssetTemporaryTicket assetTicket,
    required int galleryId,
  }) async =>
    _post(
      '/meme/create',
      body: meme,
      queryParameters: {
        'asset': assetTicket.temporaryTicket,
        'gallery_id': galleryId.toString(),
      },
    );

  Future<Meme> getMeme(int galleryId, int memeId) async =>
    _get('/meme/${galleryId}_$memeId');

  Future<List<MemeTag>> getMemeTags(int galleryId, int memeId) =>
    _get('/meme/${galleryId}_$memeId/tags');

  Future<List<MemeTag>> voteForMemeTag(int galleryId, int memeId, int tagId, VoteType? vote) =>
    _post('/meme/${galleryId}_$memeId/vote/$tagId', body: RequestBodyVote(type: vote));

  Future<Tenant> getMyTenantProfile() =>
    _get('/tenant/my_profile');

  Future<Tenant> getTenant(int id) =>
    _get('/tenant/$id');

  Future<TenantProfile> getTenantProfile(int id) =>
    _get('/tenant/$id/profile');

  Future<List<FeedItem>> getFeed(int offset, int limit, FeedType type) =>
    _get(
      type == FeedType.latest
        ? '/feed/public'
        : '/feed/recommended',
      queryParameters: {
        'offset': offset.toString(),
        'limit': limit.toString(),
      },
    );

  Future<List<AvailableGalleryName>> getAvailableGalleryNames() =>
    _get('/gallery/available_names');

  Future<AssetTemporaryTicket> uploadAsset(Uint8List data, AssetType type) =>
    _postBinary(
      '/asset/upload',
      bodyBytes: data,
      queryParameters: const { 'type': 'IMAGE' },
    );

  Uri getAssetUri(int assetId) => baseUri.replace(
    path: '${baseUri.path}/asset/$assetId',
  );

  Future<AuthResult> auth(int telegramUserId, RequestBodyAuth bodyAuth) =>
    _post('/service/tg/external_user/$telegramUserId/auth', body: bodyAuth);
}
