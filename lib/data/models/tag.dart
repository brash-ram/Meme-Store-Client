import 'package:dart_mappable/dart_mappable.dart';

import 'model_object.dart';

part 'tag.mapper.dart';


@MappableClass()
class Tag extends ModelObject with TagMappable {
  const Tag({
    required super.id,
    required this.name,
  });

  @MappableField(key: 'name')
  final String name;
}
