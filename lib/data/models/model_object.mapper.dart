// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'model_object.dart';

class ModelObjectMapper extends ClassMapperBase<ModelObject> {
  ModelObjectMapper._();

  static ModelObjectMapper? _instance;
  static ModelObjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModelObjectMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ModelObject';

  static int _$id(ModelObject v) => v.id;
  static const Field<ModelObject, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<ModelObject> fields = const {
    #id: _f$id,
  };

  static ModelObject _instantiate(DecodingData data) {
    return ModelObject(id: data.dec(_f$id));
  }

  @override
  final Function instantiate = _instantiate;

  static ModelObject fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ModelObject>(map);
  }

  static ModelObject fromJson(String json) {
    return ensureInitialized().decodeJson<ModelObject>(json);
  }
}

mixin ModelObjectMappable {
  String toJson() {
    return ModelObjectMapper.ensureInitialized()
        .encodeJson<ModelObject>(this as ModelObject);
  }

  Map<String, dynamic> toMap() {
    return ModelObjectMapper.ensureInitialized()
        .encodeMap<ModelObject>(this as ModelObject);
  }

  @override
  String toString() {
    return ModelObjectMapper.ensureInitialized()
        .stringifyValue(this as ModelObject);
  }
}
