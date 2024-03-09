import 'package:dart_mappable/dart_mappable.dart';

part 'model_object.mapper.dart';


@MappableClass()
class ModelObject with ModelObjectMappable {
  const ModelObject({required this.id});

  @MappableField(key: 'id')
  final int id;
}
