import 'package:dart_mappable/dart_mappable.dart';
part 'role_enum.mapper.dart';
@MappableEnum()
enum RoleEnum {
  anonymous(0),
  authorized(1),
  privateUploader(2),
  publicUploader(3),
  voter(4),
  tagAssigner(5),
  tagCreator(6),
  privateAlbumCreator(7),
  publicAlbumCreator(8),

  globalAdmin(256),
  debugView(257),
  tagVoteModerator(258),
  tagModerator(259),
  uploadsModerator(260),
  publicAlbumModerator(261),
  privateAlbumModerator(262),
  userTenantModerator(263),
  allowsDeletionOfUserTenants(264),

  serviceCreateUserTenants(265),
  serviceAuthorizeUserTenants(266);

  const RoleEnum(this.id);

  final int id;


  static RoleEnum getFromId(int id) {
    for (final role in RoleEnum.values) {
      if (role.id == id) {
        return role;
      }
    }
    return RoleEnum.anonymous;
  }
}
