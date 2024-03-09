import 'package:dart_mappable/dart_mappable.dart';

part 'vote_type.mapper.dart';


@MappableEnum(mode: ValuesMode.indexed)
enum VoteType {
  @MappableValue(0) down(0),
  @MappableValue(1) up(1),
  ;

  const VoteType(this.id);

  final int id;

  static VoteType fromId(int id) =>
    values.firstWhere((element) => element.id == id);
}
