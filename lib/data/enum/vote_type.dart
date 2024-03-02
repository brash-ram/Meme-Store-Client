import 'package:dart_mappable/dart_mappable.dart';
part 'vote_type.mapper.dart';
@MappableEnum()
enum VoteType {
  down(0),
  up(1);

  const VoteType(this.id);

  final int id;


  static VoteType getFromId(int id) {
    for (final role in VoteType.values) {
      if (role.id == id) {
        return role;
      }
    }
    return VoteType.down;
  }
}