import 'package:dart_mappable/dart_mappable.dart';

import 'model_object.dart';

part 'auth_result.mapper.dart';


@MappableClass()
class AuthResult extends ModelObject with AuthResultMappable {
  const AuthResult({
    required super.id,
    required this.telegramUserId,
    required this.accessToken,
    required this.refreshToken,
  });

  @MappableField(key: 'tgId')
  final int telegramUserId;
  @MappableField(key: 'accessToken')
  final String accessToken;
  @MappableField(key: 'refreshToken')
  final String refreshToken;
}
