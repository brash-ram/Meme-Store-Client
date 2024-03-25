// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'available_gallery_name.dart';

class AvailableGalleryNameMapper extends ClassMapperBase<AvailableGalleryName> {
  AvailableGalleryNameMapper._();

  static AvailableGalleryNameMapper? _instance;
  static AvailableGalleryNameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvailableGalleryNameMapper._());
      ModelObjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AvailableGalleryName';

  static int _$id(AvailableGalleryName v) => v.id;
  static const Field<AvailableGalleryName, int> _f$id = Field('id', _$id);
  static String _$name(AvailableGalleryName v) => v.name;
  static const Field<AvailableGalleryName, String> _f$name =
      Field('name', _$name);

  @override
  final MappableFields<AvailableGalleryName> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static AvailableGalleryName _instantiate(DecodingData data) {
    return AvailableGalleryName(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static AvailableGalleryName fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AvailableGalleryName>(map);
  }

  static AvailableGalleryName fromJson(String json) {
    return ensureInitialized().decodeJson<AvailableGalleryName>(json);
  }
}

mixin AvailableGalleryNameMappable {
  String toJson() {
    return AvailableGalleryNameMapper.ensureInitialized()
        .encodeJson<AvailableGalleryName>(this as AvailableGalleryName);
  }

  Map<String, dynamic> toMap() {
    return AvailableGalleryNameMapper.ensureInitialized()
        .encodeMap<AvailableGalleryName>(this as AvailableGalleryName);
  }

  @override
  String toString() {
    return AvailableGalleryNameMapper.ensureInitialized()
        .stringifyValue(this as AvailableGalleryName);
  }
}
