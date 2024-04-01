import 'package:http/http.dart' as http;

import '/telegram_auth/telegram_events.dart';


class AuthController {
  TelegramAuthData? _authData;
  String? _token;

  void setAuth(TelegramAuthData authData, String token) {
    _authData = authData;
    _token = token;
  }

  (TelegramAuthData, String)? get token => switch ((_authData, _token)) {
    (final authData?, final token?) => (authData, token),
    (null, null) => null,
    _ => throw StateError('Invalid state'),
  };

  bool get hasAuth => token != null;

  Map<String, String> get authHeaders => switch(_token) {
    final token? => { 'authorization': 'Bearer $token', },
    _ => const {}
  };

  bool authorizeRequest(http.Request request) {
    if (token != null) {
      request.headers.addAll(authHeaders);
      return true;
    }
    return false;
  }
}
