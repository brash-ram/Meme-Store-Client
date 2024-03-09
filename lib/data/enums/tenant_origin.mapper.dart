// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tenant_origin.dart';

class TenantOriginMapper extends EnumMapper<TenantOrigin> {
  TenantOriginMapper._();

  static TenantOriginMapper? _instance;
  static TenantOriginMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TenantOriginMapper._());
    }
    return _instance!;
  }

  static TenantOrigin fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TenantOrigin decode(dynamic value) {
    switch (value) {
      case 'internal/system':
        return TenantOrigin.internalSystem;
      case 'internal/user':
        return TenantOrigin.internalUser;
      case 'internal/service':
        return TenantOrigin.internalService;
      case 'external/tg':
        return TenantOrigin.externalTelegram;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TenantOrigin self) {
    switch (self) {
      case TenantOrigin.internalSystem:
        return 'internal/system';
      case TenantOrigin.internalUser:
        return 'internal/user';
      case TenantOrigin.internalService:
        return 'internal/service';
      case TenantOrigin.externalTelegram:
        return 'external/tg';
    }
  }
}

extension TenantOriginMapperExtension on TenantOrigin {
  dynamic toValue() {
    TenantOriginMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TenantOrigin>(this);
  }
}
