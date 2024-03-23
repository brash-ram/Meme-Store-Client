import 'package:http/http.dart' as http;


class AuthController {
  String? token;

  Map<String, String> get authHeaders => switch(token) {
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
