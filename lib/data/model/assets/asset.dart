import 'package:dart_mappable/dart_mappable.dart';

import '../../enum/asset_type.dart';
import '../model_object.dart';

part 'asset.mapper.dart';

@MappableClass()
class Asset extends ModelObject with AssetMappable {
  Asset({
    required super.id,
    required this.type,
    required this.blurhash,
  });

  @MappableField(key: 'type')
  final AssetType type;

  @MappableField(key: 'blurhash')
  final String blurhash;
}