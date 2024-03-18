import 'package:http/http.dart' as http;


class AuthController {
  String? token;

  bool authorizeRequest(http.Request request) {
    if (token case final _token?) {
      request.headers['authorization'] = 'Bearer $_token';
    }
    return false;
  }
}
