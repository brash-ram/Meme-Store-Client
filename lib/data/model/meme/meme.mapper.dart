// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'meme.dart';

class MemeMapper extends ClassMapperBase<Meme> {
  MemeMapper._();

  static MemeMapper? _instance;
  static MemeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MemeMapper._());
      ModelObjectMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Meme';

  static int _$id(Meme v) => v.id;
  static const Field<Meme, int> _f$id = Field('id', _$id);
  static int _$authorId(Meme v) => v.authorId;
  static const Field<Meme, int> _f$authorId =
      Field('authorId', _$authorId, key: 'author_id');
  static int _$assetId(Meme v) => v.assetId;
  static const Field<Meme, int> _f$assetId =
      Field('assetId', _$assetId, key: 'asset_id');
  static List<int> _$tagIds(Meme v) => v.tagIds;
  static const Field<Meme, List<int>> _f$tagIds =
      Field('tagIds', _$tagIds, key: 'tag_ids');
  static String _$title(Meme v) => v.title;
  static const Field<Meme, String> _f$title = Field('title', _$title);
  static String _$description(Meme v) => v.description;
  static const Field<Meme, String> _f$description =
      Field('description', _$description);

  @override
  final MappableFields<Meme> fields = const {
    #id: _f$id,
    #authorId: _f$authorId,
    #assetId: _f$assetId,
    #tagIds: _f$tagIds,
    #title: _f$title,
    #description: _f$description,
  };

  static Meme _instantiate(DecodingData data) {
    return Meme(
        id: data.dec(_f$id),
        authorId: data.dec(_f$authorId),
        assetId: data.dec(_f$assetId),
        tagIds: data.dec(_f$tagIds),
        title: data.dec(_f$title),
        description: data.dec(_f$description));
  }

  @override
  final Function instantiate = _instantiate;

  static Meme fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Meme>(map);
  }

  static Meme fromJson(String json) {
    return ensureInitialized().decodeJson<Meme>(json);
  }
}

mixin MemeMappable {
  String toJson() {
    return MemeMapper.ensureInitialized().encodeJson<Meme>(this as Meme);
  }

  Map<String, dynamic> toMap() {
    return MemeMapper.ensureInitialized().encodeMap<Meme>(this as Meme);
  }

  @override
  String toString() {
    return MemeMapper.ensureInitialized().stringifyValue(this as Meme);
  }
}
