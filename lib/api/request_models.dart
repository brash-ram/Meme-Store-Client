import 'package:dart_mappable/dart_mappable.dart';

import '/data.dart';

part 'request_models.mapper.dart';


@MappableRecord()
typedef RequestBodyVote = ({
  VoteType? type,
});
