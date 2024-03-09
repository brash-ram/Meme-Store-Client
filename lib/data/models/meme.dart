import 'package:dart_mappable/dart_mappable.dart';

import 'model_object.dart';

part 'meme.mapper.dart';


@MappableClass()
class Meme extends ModelObject with MemeMappable {
  const Meme({
    required super.id,
    required this.authorId,
    required this.assetId,
    required this.tagIds,
    required this.title,
    required this.description,
  });

  @MappableField(key: 'author_id')
  final int authorId;

  @MappableField(key: 'asset_id')
  final int assetId;

  @MappableField(key: 'tag_ids')
  final List<int> tagIds;

  @MappableField(key: 'title')
  final String title;

  @MappableField(key: 'description')
  final String description;
}
