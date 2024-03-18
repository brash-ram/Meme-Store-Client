import 'package:dart_mappable/dart_mappable.dart';
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
    }
  ) async {
    final _method = method.toUpperCase();
    assert(
      switch(_method) {
        'GET' || 'HEAD' when body != null => false,
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
  }) => _request<T, Never>(
      path,
      queryParameters: queryParameters,
      headers: headers,
    )
    .then((value) => value.result);

  Future<Meme> getMeme(int galleryId, int memeId) async =>
    _get('/meme/${galleryId}_$memeId');
}
