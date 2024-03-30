import 'package:dart_mappable/dart_mappable.dart';

import '../enums/vote_type.dart';

part 'request_body_vote.mapper.dart';


@MappableClass()
class RequestBodyVote with RequestBodyVoteMappable {
  const RequestBodyVote({
    required this.type,
  });

  @MappableField(key: 'type')
  final VoteType? type;
}
