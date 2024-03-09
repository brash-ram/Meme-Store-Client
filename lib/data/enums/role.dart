import 'package:dart_mappable/dart_mappable.dart';

part 'role.mapper.dart';


@MappableEnum(mode: ValuesMode.named)
enum Role {
  @MappableValue(0) anonymous(0),
  @MappableValue(1) authorized(1),
  @MappableValue(2) privateUploader(2),
  @MappableValue(3) publicUploader(3),
  @MappableValue(4) voter(4),
  @MappableValue(5) tagAssigner(5),
  @MappableValue(6) tagCreator(6),
  @MappableValue(7) privateAlbumCreator(7),
  @MappableValue(8) publicAlbumCreator(8),

  @MappableValue(256) globalAdmin(256),
  @MappableValue(257) debugView(257),
  @MappableValue(258) tagVoteModerator(258),
  @MappableValue(259) tagModerator(259),
  @MappableValue(260) uploadsModerator(260),
  @MappableValue(261) publicAlbumModerator(261),
  @MappableValue(262) privateAlbumModerator(262),
  @MappableValue(263) userTenantModerator(263),
  @MappableValue(264) allowsDeletionOfUserTenants(264),

  @MappableValue(265) serviceCreateUserTenants(265),
  @MappableValue(266) serviceAuthorizeUserTenants(266),
  ;

  const Role(this.id);

  final int id;

  /// Assumes ID is always correct and valid
  static Role fromId(int id) =>
    values.firstWhere((element) => element.id == id);
}
