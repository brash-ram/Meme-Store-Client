import 'package:dart_mappable/dart_mappable.dart';

part 'asset_type.mapper.dart';


@MappableEnum(mode: ValuesMode.named)
enum AssetType {
  @MappableValue('IMAGE')
  image,
  ;
}
