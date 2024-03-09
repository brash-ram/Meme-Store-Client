import 'package:dart_mappable/dart_mappable.dart';

import '../../enums.dart';
import '../model_object.dart';

part 'asset.mapper.dart';


@MappableClass()
class Asset extends ModelObject with AssetMappable {
  const Asset({
    required super.id,
    required this.type,
    required this.blurHash,
  });

  @MappableField(key: 'type')
  final AssetType type;

  @MappableField(key: 'blurhash')
  final String blurHash;
}
