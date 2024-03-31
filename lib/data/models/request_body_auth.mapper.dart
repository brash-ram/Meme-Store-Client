// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_body_auth.dart';

class RequestBodyAuthMapper extends ClassMapperBase<RequestBodyAuth> {
  RequestBodyAuthMapper._();

  static RequestBodyAuthMapper? _instance;
  static RequestBodyAuthMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestBodyAuthMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RequestBodyAuth';

  static String _$fullName(RequestBodyAuth v) => v.fullName;
  static const Field<RequestBodyAuth, String> _f$fullName =
      Field('fullName', _$fullName);
  static String _$username(RequestBodyAuth v) => v.username;
  static const Field<RequestBodyAuth, String> _f$username =
      Field('username', _$username);

  @override
  final MappableFields<RequestBodyAuth> fields = const {
    #fullName: _f$fullName,
    #username: _f$username,
  };

  static RequestBodyAuth _instantiate(DecodingData data) {
    return RequestBodyAuth(
        fullName: data.dec(_f$fullName), username: data.dec(_f$username));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestBodyAuth fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestBodyAuth>(map);
  }

  static RequestBodyAuth fromJson(String json) {
    return ensureInitialized().decodeJson<RequestBodyAuth>(json);
  }
}

mixin RequestBodyAuthMappable {
  String toJson() {
    return RequestBodyAuthMapper.ensureInitialized()
        .encodeJson<RequestBodyAuth>(this as RequestBodyAuth);
  }

  Map<String, dynamic> toMap() {
    return RequestBodyAuthMapper.ensureInitialized()
        .encodeMap<RequestBodyAuth>(this as RequestBodyAuth);
  }

  @override
  String toString() {
    return RequestBodyAuthMapper.ensureInitialized()
        .stringifyValue(this as RequestBodyAuth);
  }
}
