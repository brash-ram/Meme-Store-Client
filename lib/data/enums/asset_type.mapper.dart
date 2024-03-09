// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'asset_type.dart';

class AssetTypeMapper extends EnumMapper<AssetType> {
  AssetTypeMapper._();

  static AssetTypeMapper? _instance;
  static AssetTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssetTypeMapper._());
    }
    return _instance!;
  }

  static AssetType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AssetType decode(dynamic value) {
    switch (value) {
      case 'image':
        return AssetType.image;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AssetType self) {
    switch (self) {
      case AssetType.image:
        return 'image';
    }
  }
}

extension AssetTypeMapperExtension on AssetType {
  String toValue() {
    AssetTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AssetType>(this) as String;
  }
}
