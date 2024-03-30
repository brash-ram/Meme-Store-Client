// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_body_vote.dart';

class RequestBodyVoteMapper extends ClassMapperBase<RequestBodyVote> {
  RequestBodyVoteMapper._();

  static RequestBodyVoteMapper? _instance;
  static RequestBodyVoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestBodyVoteMapper._());
      VoteTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RequestBodyVote';

  static VoteType? _$type(RequestBodyVote v) => v.type;
  static const Field<RequestBodyVote, VoteType> _f$type = Field('type', _$type);

  @override
  final MappableFields<RequestBodyVote> fields = const {
    #type: _f$type,
  };

  static RequestBodyVote _instantiate(DecodingData data) {
    return RequestBodyVote(type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static RequestBodyVote fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RequestBodyVote>(map);
  }

  static RequestBodyVote fromJson(String json) {
    return ensureInitialized().decodeJson<RequestBodyVote>(json);
  }
}

mixin RequestBodyVoteMappable {
  String toJson() {
    return RequestBodyVoteMapper.ensureInitialized()
        .encodeJson<RequestBodyVote>(this as RequestBodyVote);
  }

  Map<String, dynamic> toMap() {
    return RequestBodyVoteMapper.ensureInitialized()
        .encodeMap<RequestBodyVote>(this as RequestBodyVote);
  }

  @override
  String toString() {
    return RequestBodyVoteMapper.ensureInitialized()
        .stringifyValue(this as RequestBodyVote);
  }
}
