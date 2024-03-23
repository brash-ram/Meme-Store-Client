import 'package:dart_mappable/dart_mappable.dart';

import '../enums/vote_type.dart';
import 'tag.dart';

part 'meme_tag.mapper.dart';


@MappableClass()
class MemeTag extends Tag with MemeTagMappable {
  const MemeTag({
    required super.id,
    required super.name,
    required this.memeId,
    required this.score,
    this.myVote,
  });

  @MappableField(key: 'meme_id')
  final int memeId;

  @MappableField(key: 'score')
  final int score;

  @MappableField(key: 'my_vote')
  final VoteType? myVote;
}
