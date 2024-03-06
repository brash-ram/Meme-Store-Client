// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'image.dart';

class ImageMapper extends ClassMapperBase<Image> {
  ImageMapper._();

  static ImageMapper? _instance;
  static ImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageMapper._());
      AssetMapper.ensureInitialized();
      AssetTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Image';

  static int _$id(Image v) => v.id;
  static const Field<Image, int> _f$id = Field('id', _$id);
  static AssetType _$type(Image v) => v.type;
  static const Field<Image, AssetType> _f$type = Field('type', _$type);
  static String _$blurhash(Image v) => v.blurhash;
  static const Field<Image, String> _f$blurhash = Field('blurhash', _$blurhash);
  static String _$uri(Image v) => v.uri;
  static const Field<Image, String> _f$uri = Field('uri', _$uri);

  @override
  final MappableFields<Image> fields = const {
    #id: _f$id,
    #type: _f$type,
    #blurhash: _f$blurhash,
    #uri: _f$uri,
  };

  static Image _instantiate(DecodingData data) {
    return Image(
        id: data.dec(_f$id),
        type: data.dec(_f$type),
        blurhash: data.dec(_f$blurhash),
        uri: data.dec(_f$uri));
  }

  @override
  final Function instantiate = _instantiate;

  static Image fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Image>(map);
  }

  static Image fromJson(String json) {
    return ensureInitialized().decodeJson<Image>(json);
  }
}

mixin ImageMappable {
  String toJson() {
    return ImageMapper.ensureInitialized().encodeJson<Image>(this as Image);
  }

  Map<String, dynamic> toMap() {
    return ImageMapper.ensureInitialized().encodeMap<Image>(this as Image);
  }

  @override
  String toString() {
    return ImageMapper.ensureInitialized().stringifyValue(this as Image);
  }
}
