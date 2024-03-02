import 'package:dart_mappable/dart_mappable.dart';

import '../../enum/asset_type.dart';
import 'asset.dart';

part 'image.mapper.dart';

@MappableClass()
class Image extends Asset with ImageMappable {

  Image({
  required super.id,
  required super.type,
  required super.blurhash,
  required this.uri,
  });

  @MappableField(key: 'uri')
  final String uri;
}
