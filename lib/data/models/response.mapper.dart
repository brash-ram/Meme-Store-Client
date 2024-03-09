// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'response.dart';

class ResponseMapper extends ClassMapperBase<Response> {
  ResponseMapper._();

  static ResponseMapper? _instance;
  static ResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResponseMapper._());
      ResponseOkMapper.ensureInitialized();
      ResponseInvalidMapper.ensureInitialized();
      ResponseErrorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Response';
  @override
  Function get typeFactory => <T>(f) => f<Response<T>>();

  static bool _$isError(Response v) => v.isError;
  static const Field<Response, bool> _f$isError =
      Field('isError', _$isError, key: 'error');

  @override
  final MappableFields<Response> fields = const {
    #isError: _f$isError,
  };

  static Response<T> _instantiate<T>(DecodingData data) {
    throw MapperException.missingConstructor('Response');
  }

  @override
  final Function instantiate = _instantiate;

  static Response<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Response<T>>(map);
  }

  static Response<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<Response<T>>(json);
  }
}

mixin ResponseMappable<T> {
  String toJson();
  Map<String, dynamic> toMap();
}

class ResponseOkMapper extends SubClassMapperBase<ResponseOk> {
  ResponseOkMapper._();

  static ResponseOkMapper? _instance;
  static ResponseOkMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResponseOkMapper._());
      ResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ResponseOk';
  @override
  Function get typeFactory => <T>(f) => f<ResponseOk<T>>();

  static dynamic _$result(ResponseOk v) => v.result;
  static dynamic _arg$result<T>(f) => f<T>();
  static const Field<ResponseOk, dynamic> _f$result =
      Field('result', _$result, arg: _arg$result);
  static Object? _$related(ResponseOk v) => v.related;
  static const Field<ResponseOk, Object> _f$related =
      Field('related', _$related, opt: true);
  static bool _$isError(ResponseOk v) => v.isError;
  static const Field<ResponseOk, bool> _f$isError =
      Field('isError', _$isError, key: 'error');

  @override
  final MappableFields<ResponseOk> fields = const {
    #result: _f$result,
    #related: _f$related,
    #isError: _f$isError,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = ResponseOk._checkType;
  @override
  late final ClassMapperBase superMapper = ResponseMapper.ensureInitialized();

  static ResponseOk<T> _instantiate<T>(DecodingData data) {
    return ResponseOk(
        result: data.dec(_f$result), related: data.dec(_f$related));
  }

  @override
  final Function instantiate = _instantiate;

  static ResponseOk<T> fromMap<T>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResponseOk<T>>(map);
  }

  static ResponseOk<T> fromJson<T>(String json) {
    return ensureInitialized().decodeJson<ResponseOk<T>>(json);
  }
}

mixin ResponseOkMappable<T> {
  String toJson() {
    return ResponseOkMapper.ensureInitialized()
        .encodeJson<ResponseOk<T>>(this as ResponseOk<T>);
  }

  Map<String, dynamic> toMap() {
    return ResponseOkMapper.ensureInitialized()
        .encodeMap<ResponseOk<T>>(this as ResponseOk<T>);
  }

  @override
  String toString() {
    return ResponseOkMapper.ensureInitialized()
        .stringifyValue(this as ResponseOk<T>);
  }
}

class ResponseInvalidMapper extends SubClassMapperBase<ResponseInvalid> {
  ResponseInvalidMapper._();

  static ResponseInvalidMapper? _instance;
  static ResponseInvalidMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResponseInvalidMapper._());
      ResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ResponseInvalid';

  static Object? _$rawResponse(ResponseInvalid v) => v.rawResponse;
  static const Field<ResponseInvalid, Object> _f$rawResponse =
      Field('rawResponse', _$rawResponse, key: 'raw_response', opt: true);
  static bool _$isError(ResponseInvalid v) => v.isError;
  static const Field<ResponseInvalid, bool> _f$isError =
      Field('isError', _$isError, key: 'error');

  @override
  final MappableFields<ResponseInvalid> fields = const {
    #rawResponse: _f$rawResponse,
    #isError: _f$isError,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper = ResponseMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: () => []);
  }

  @override
  final MappingHook hook = const _ResponseInvalidHook();
  static ResponseInvalid _instantiate(DecodingData data) {
    return ResponseInvalid(data.dec(_f$rawResponse));
  }

  @override
  final Function instantiate = _instantiate;

  static ResponseInvalid fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResponseInvalid>(map);
  }

  static ResponseInvalid fromJson(String json) {
    return ensureInitialized().decodeJson<ResponseInvalid>(json);
  }
}

mixin ResponseInvalidMappable {
  String toJson() {
    return ResponseInvalidMapper.ensureInitialized()
        .encodeJson<ResponseInvalid>(this as ResponseInvalid);
  }

  Map<String, dynamic> toMap() {
    return ResponseInvalidMapper.ensureInitialized()
        .encodeMap<ResponseInvalid>(this as ResponseInvalid);
  }

  @override
  String toString() {
    return ResponseInvalidMapper.ensureInitialized()
        .stringifyValue(this as ResponseInvalid);
  }
}

class ResponseErrorMapper extends SubClassMapperBase<ResponseError> {
  ResponseErrorMapper._();

  static ResponseErrorMapper? _instance;
  static ResponseErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResponseErrorMapper._());
      ResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ResponseError';

  static int _$code(ResponseError v) => v.code;
  static const Field<ResponseError, int> _f$code = Field('code', _$code);
  static String _$message(ResponseError v) => v.message;
  static const Field<ResponseError, String> _f$message =
      Field('message', _$message);
  static bool _$isError(ResponseError v) => v.isError;
  static const Field<ResponseError, bool> _f$isError =
      Field('isError', _$isError, key: 'error');

  @override
  final MappableFields<ResponseError> fields = const {
    #code: _f$code,
    #message: _f$message,
    #isError: _f$isError,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = ResponseError._checkType;
  @override
  late final ClassMapperBase superMapper = ResponseMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: () => []);
  }

  static ResponseError _instantiate(DecodingData data) {
    return ResponseError(
        code: data.dec(_f$code), message: data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ResponseError fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResponseError>(map);
  }

  static ResponseError fromJson(String json) {
    return ensureInitialized().decodeJson<ResponseError>(json);
  }
}

mixin ResponseErrorMappable {
  String toJson() {
    return ResponseErrorMapper.ensureInitialized()
        .encodeJson<ResponseError>(this as ResponseError);
  }

  Map<String, dynamic> toMap() {
    return ResponseErrorMapper.ensureInitialized()
        .encodeMap<ResponseError>(this as ResponseError);
  }

  @override
  String toString() {
    return ResponseErrorMapper.ensureInitialized()
        .stringifyValue(this as ResponseError);
  }
}
