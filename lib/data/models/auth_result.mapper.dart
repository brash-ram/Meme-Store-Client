// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_result.dart';

class AuthResultMapper extends ClassMapperBase<AuthResult> {
  AuthResultMapper._();

  static AuthResultMapper? _instance;
  static AuthResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthResultMapper._());
      ModelObjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthResult';

  static int _$id(AuthResult v) => v.id;
  static const Field<AuthResult, int> _f$id = Field('id', _$id);
  static int _$telegramUserId(AuthResult v) => v.telegramUserId;
  static const Field<AuthResult, int> _f$telegramUserId =
      Field('telegramUserId', _$telegramUserId, key: 'tgId');
  static String _$accessToken(AuthResult v) => v.accessToken;
  static const Field<AuthResult, String> _f$accessToken =
      Field('accessToken', _$accessToken);
  static String _$refreshToken(AuthResult v) => v.refreshToken;
  static const Field<AuthResult, String> _f$refreshToken =
      Field('refreshToken', _$refreshToken);

  @override
  final MappableFields<AuthResult> fields = const {
    #id: _f$id,
    #telegramUserId: _f$telegramUserId,
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
  };

  static AuthResult _instantiate(DecodingData data) {
    return AuthResult(
        id: data.dec(_f$id),
        telegramUserId: data.dec(_f$telegramUserId),
        accessToken: data.dec(_f$accessToken),
        refreshToken: data.dec(_f$refreshToken));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthResult>(map);
  }

  static AuthResult fromJson(String json) {
    return ensureInitialized().decodeJson<AuthResult>(json);
  }
}

mixin AuthResultMappable {
  String toJson() {
    return AuthResultMapper.ensureInitialized()
        .encodeJson<AuthResult>(this as AuthResult);
  }

  Map<String, dynamic> toMap() {
    return AuthResultMapper.ensureInitialized()
        .encodeMap<AuthResult>(this as AuthResult);
  }

  @override
  String toString() {
    return AuthResultMapper.ensureInitialized()
        .stringifyValue(this as AuthResult);
  }
}
