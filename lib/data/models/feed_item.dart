import 'package:dart_mappable/dart_mappable.dart';

part 'feed_item.mapper.dart';


@MappableClass()
class FeedItem with FeedItemMappable {
  const FeedItem({
    required this.galleryId,
    required this.memeId,
  });

  @MappableField(key: 'gallery_id')
  final int galleryId;

  @MappableField(key: 'meme_id')
  final int memeId;
}
