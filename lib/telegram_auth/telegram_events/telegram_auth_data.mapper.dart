// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'telegram_auth_data.dart';

class TelegramAuthDataMapper extends ClassMapperBase<TelegramAuthData> {
  TelegramAuthDataMapper._();

  static TelegramAuthDataMapper? _instance;
  static TelegramAuthDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TelegramAuthDataMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TelegramAuthData';

  static int _$id(TelegramAuthData v) => v.id;
  static const Field<TelegramAuthData, int> _f$id = Field('id', _$id);
  static String _$firstName(TelegramAuthData v) => v.firstName;
  static const Field<TelegramAuthData, String> _f$firstName =
      Field('firstName', _$firstName, key: 'first_name');
  static String? _$lastName(TelegramAuthData v) => v.lastName;
  static const Field<TelegramAuthData, String> _f$lastName =
      Field('lastName', _$lastName, key: 'last_name');
  static String? _$username(TelegramAuthData v) => v.username;
  static const Field<TelegramAuthData, String> _f$username =
      Field('username', _$username);
  static String? _$photoUrl(TelegramAuthData v) => v.photoUrl;
  static const Field<TelegramAuthData, String> _f$photoUrl =
      Field('photoUrl', _$photoUrl, key: 'photo_url');
  static DateTime _$authDate(TelegramAuthData v) => v.authDate;
  static const Field<TelegramAuthData, DateTime> _f$authDate =
      Field('authDate', _$authDate, key: 'auth_date', hook: _AuthDateHook());
  static String _$hash(TelegramAuthData v) => v.hash;
  static const Field<TelegramAuthData, String> _f$hash = Field('hash', _$hash);

  @override
  final MappableFields<TelegramAuthData> fields = const {
    #id: _f$id,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #username: _f$username,
    #photoUrl: _f$photoUrl,
    #authDate: _f$authDate,
    #hash: _f$hash,
  };

  static TelegramAuthData _instantiate(DecodingData data) {
    return TelegramAuthData(
        id: data.dec(_f$id),
        firstName: data.dec(_f$firstName),
        lastName: data.dec(_f$lastName),
        username: data.dec(_f$username),
        photoUrl: data.dec(_f$photoUrl),
        authDate: data.dec(_f$authDate),
        hash: data.dec(_f$hash));
  }

  @override
  final Function instantiate = _instantiate;

  static TelegramAuthData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TelegramAuthData>(map);
  }

  static TelegramAuthData fromJson(String json) {
    return ensureInitialized().decodeJson<TelegramAuthData>(json);
  }
}

mixin TelegramAuthDataMappable {
  String toJson() {
    return TelegramAuthDataMapper.ensureInitialized()
        .encodeJson<TelegramAuthData>(this as TelegramAuthData);
  }

  Map<String, dynamic> toMap() {
    return TelegramAuthDataMapper.ensureInitialized()
        .encodeMap<TelegramAuthData>(this as TelegramAuthData);
  }

  @override
  String toString() {
    return TelegramAuthDataMapper.ensureInitialized()
        .stringifyValue(this as TelegramAuthData);
  }
}
