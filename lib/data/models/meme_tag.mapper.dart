// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'meme_tag.dart';

class MemeTagMapper extends ClassMapperBase<MemeTag> {
  MemeTagMapper._();

  static MemeTagMapper? _instance;
  static MemeTagMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MemeTagMapper._());
      TagMapper.ensureInitialized();
      VoteTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MemeTag';

  static int _$id(MemeTag v) => v.id;
  static const Field<MemeTag, int> _f$id = Field('id', _$id);
  static String _$name(MemeTag v) => v.name;
  static const Field<MemeTag, String> _f$name = Field('name', _$name);
  static int _$memeId(MemeTag v) => v.memeId;
  static const Field<MemeTag, int> _f$memeId =
      Field('memeId', _$memeId, key: 'meme_id');
  static int _$score(MemeTag v) => v.score;
  static const Field<MemeTag, int> _f$score = Field('score', _$score);
  static VoteType? _$myVote(MemeTag v) => v.myVote;
  static const Field<MemeTag, VoteType> _f$myVote =
      Field('myVote', _$myVote, key: 'my_vote', opt: true);

  @override
  final MappableFields<MemeTag> fields = const {
    #id: _f$id,
    #name: _f$name,
    #memeId: _f$memeId,
    #score: _f$score,
    #myVote: _f$myVote,
  };

  static MemeTag _instantiate(DecodingData data) {
    return MemeTag(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        memeId: data.dec(_f$memeId),
        score: data.dec(_f$score),
        myVote: data.dec(_f$myVote));
  }

  @override
  final Function instantiate = _instantiate;

  static MemeTag fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MemeTag>(map);
  }

  static MemeTag fromJson(String json) {
    return ensureInitialized().decodeJson<MemeTag>(json);
  }
}

mixin MemeTagMappable {
  String toJson() {
    return MemeTagMapper.ensureInitialized()
        .encodeJson<MemeTag>(this as MemeTag);
  }

  Map<String, dynamic> toMap() {
    return MemeTagMapper.ensureInitialized()
        .encodeMap<MemeTag>(this as MemeTag);
  }

  @override
  String toString() {
    return MemeTagMapper.ensureInitialized().stringifyValue(this as MemeTag);
  }
}
