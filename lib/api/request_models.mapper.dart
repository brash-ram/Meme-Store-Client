// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'request_models.dart';

class RequestBodyVoteMapper extends RecordMapperBase<RequestBodyVote> {
  static RequestBodyVoteMapper? _instance;
  RequestBodyVoteMapper._();

  static RequestBodyVoteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RequestBodyVoteMapper._());
      MapperBase.addType(<A>(f) => f<({A type})>());
    }
    return _instance!;
  }

  static VoteType? _$type(RequestBodyVote v) => v.type;
  static const Field<RequestBodyVote, VoteType> _f$type = Field('type', _$type);

  @override
  final MappableFields<RequestBodyVote> fields = const {
    #type: _f$type,
  };

  @override
  Function get typeFactory => (f) => f<RequestBodyVote>();

  @override
  List<Type> apply(MappingContext context) {
    return [];
  }

  static RequestBodyVote _instantiate(DecodingData<RequestBodyVote> data) {
    return (type: data.dec(_f$type));
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

extension RequestBodyVoteMappable on RequestBodyVote {
  Map<String, dynamic> toMap() {
    return RequestBodyVoteMapper.ensureInitialized().encodeMap(this);
  }

  String toJson() {
    return RequestBodyVoteMapper.ensureInitialized().encodeJson(this);
  }

  RequestBodyVoteCopyWith<RequestBodyVote> get copyWith =>
      _RequestBodyVoteCopyWithImpl(this, $identity, $identity);
}

extension RequestBodyVoteValueCopy<$R>
    on ObjectCopyWith<$R, RequestBodyVote, RequestBodyVote> {
  RequestBodyVoteCopyWith<$R> get $asRequestBodyVote =>
      $base.as((v, t, t2) => _RequestBodyVoteCopyWithImpl(v, t, t2));
}

abstract class RequestBodyVoteCopyWith<$R>
    implements RecordCopyWith<$R, RequestBodyVote> {
  $R call({VoteType? type});
  RequestBodyVoteCopyWith<$R2> $chain<$R2>(Then<RequestBodyVote, $R2> t);
}

class _RequestBodyVoteCopyWithImpl<$R>
    extends RecordCopyWithBase<$R, RequestBodyVote>
    implements RequestBodyVoteCopyWith<$R> {
  _RequestBodyVoteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final RecordMapperBase<RequestBodyVote> $mapper =
      RequestBodyVoteMapper.ensureInitialized();
  @override
  $R call({Object? type = $none}) =>
      $apply(FieldCopyWithData({if (type != $none) #type: type}));
  @override
  RequestBodyVote $make(CopyWithData data) =>
      (type: data.get(#type, or: $value.type));

  @override
  RequestBodyVoteCopyWith<$R2> $chain<$R2>(Then<RequestBodyVote, $R2> t) =>
      _RequestBodyVoteCopyWithImpl($value, $cast, t);
}
