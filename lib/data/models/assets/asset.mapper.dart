// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'asset.dart';

class AssetMapper extends ClassMapperBase<Asset> {
  AssetMapper._();

  static AssetMapper? _instance;
  static AssetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssetMapper._());
      ModelObjectMapper.ensureInitialized();
      AssetTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Asset';

  static int _$id(Asset v) => v.id;
  static const Field<Asset, int> _f$id = Field('id', _$id);
  static AssetType _$type(Asset v) => v.type;
  static const Field<Asset, AssetType> _f$type = Field('type', _$type);
  static String _$blurHash(Asset v) => v.blurHash;
  static const Field<Asset, String> _f$blurHash =
      Field('blurHash', _$blurHash, key: 'blurhash');

  @override
  final MappableFields<Asset> fields = const {
    #id: _f$id,
    #type: _f$type,
    #blurHash: _f$blurHash,
  };

  static Asset _instantiate(DecodingData data) {
    return Asset(
        id: data.dec(_f$id),
        type: data.dec(_f$type),
        blurHash: data.dec(_f$blurHash));
  }

  @override
  final Function instantiate = _instantiate;

  static Asset fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Asset>(map);
  }

  static Asset fromJson(String json) {
    return ensureInitialized().decodeJson<Asset>(json);
  }
}

mixin AssetMappable {
  String toJson() {
    return AssetMapper.ensureInitialized().encodeJson<Asset>(this as Asset);
  }

  Map<String, dynamic> toMap() {
    return AssetMapper.ensureInitialized().encodeMap<Asset>(this as Asset);
  }

  @override
  String toString() {
    return AssetMapper.ensureInitialized().stringifyValue(this as Asset);
  }
}
