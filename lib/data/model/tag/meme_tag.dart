import 'package:dart_mappable/dart_mappable.dart';

import '../model_object.dart';
part 'meme_tag.mapper.dart';

@MappableClass()
class MemeTag extends ModelObject with MemeTagMappable {

  MemeTag({
    required super.id,
    required this.memeId,
    required this.score,
    required this.myVote,
  });


  @MappableField(key: 'meme_id')
  final int memeId;


  @MappableField(key: 'score')
  final int score;


  @MappableField(key: 'my_vote')
  final int myVote;
}