import 'package:dart_mappable/dart_mappable.dart';

import 'model_object.dart';

part 'available_gallery_name.mapper.dart';


@MappableClass()
class AvailableGalleryName extends ModelObject with AvailableGalleryNameMappable {
  const AvailableGalleryName({
    required super.id,
    required this.name,
  });

  @MappableField(key: 'name')
  final String name;
}
