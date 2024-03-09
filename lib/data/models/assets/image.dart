import 'package:dart_mappable/dart_mappable.dart';

import '../../enums.dart';
import 'asset.dart';

part 'image.mapper.dart';


@MappableClass()
class Image extends Asset with ImageMappable {
  const Image({
    required super.id,
    required super.type,
    required super.blurHash,
    required this.uri,
  });

  @MappableField(key: 'uri')
  final Uri uri;
}
