// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tenant_type.dart';

class TenantTypeMapper extends EnumMapper<TenantType> {
  TenantTypeMapper._();

  static TenantTypeMapper? _instance;
  static TenantTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TenantTypeMapper._());
    }
    return _instance!;
  }

  static TenantType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TenantType decode(dynamic value) {
    switch (value) {
      case 'guest':
        return TenantType.guest;
      case 'user':
        return TenantType.user;
      case 'service':
        return TenantType.service;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TenantType self) {
    switch (self) {
      case TenantType.guest:
        return 'guest';
      case TenantType.user:
        return 'user';
      case TenantType.service:
        return 'service';
    }
  }
}

extension TenantTypeMapperExtension on TenantType {
  String toValue() {
    TenantTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TenantType>(this) as String;
  }
}
