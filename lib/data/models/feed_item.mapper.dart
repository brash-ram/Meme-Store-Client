// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'feed_item.dart';

class FeedItemMapper extends ClassMapperBase<FeedItem> {
  FeedItemMapper._();

  static FeedItemMapper? _instance;
  static FeedItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FeedItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FeedItem';

  static int _$galleryId(FeedItem v) => v.galleryId;
  static const Field<FeedItem, int> _f$galleryId =
      Field('galleryId', _$galleryId, key: 'gallery_id');
  static int _$memeId(FeedItem v) => v.memeId;
  static const Field<FeedItem, int> _f$memeId =
      Field('memeId', _$memeId, key: 'meme_id');

  @override
  final MappableFields<FeedItem> fields = const {
    #galleryId: _f$galleryId,
    #memeId: _f$memeId,
  };

  static FeedItem _instantiate(DecodingData data) {
    return FeedItem(
        galleryId: data.dec(_f$galleryId), memeId: data.dec(_f$memeId));
  }

  @override
  final Function instantiate = _instantiate;

  static FeedItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FeedItem>(map);
  }

  static FeedItem fromJson(String json) {
    return ensureInitialized().decodeJson<FeedItem>(json);
  }
}

mixin FeedItemMappable {
  String toJson() {
    return FeedItemMapper.ensureInitialized()
        .encodeJson<FeedItem>(this as FeedItem);
  }

  Map<String, dynamic> toMap() {
    return FeedItemMapper.ensureInitialized()
        .encodeMap<FeedItem>(this as FeedItem);
  }

  @override
  String toString() {
    return FeedItemMapper.ensureInitialized().stringifyValue(this as FeedItem);
  }
}
