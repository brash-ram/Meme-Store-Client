import 'package:dart_mappable/dart_mappable.dart';

part 'request_body_auth.mapper.dart';


@MappableClass()
class RequestBodyAuth with RequestBodyAuthMappable {
  const RequestBodyAuth({
    required this.fullName,
    required this.username,
  });

  @MappableField(key: 'fullName')
  final String fullName;

  @MappableField(key: 'username')
  final String username;
}
