// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'role.dart';

class RoleMapper extends EnumMapper<Role> {
  RoleMapper._();

  static RoleMapper? _instance;
  static RoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleMapper._());
    }
    return _instance!;
  }

  static Role fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Role decode(dynamic value) {
    switch (value) {
      case 0:
        return Role.anonymous;
      case 1:
        return Role.authorized;
      case 2:
        return Role.privateUploader;
      case 3:
        return Role.publicUploader;
      case 4:
        return Role.voter;
      case 5:
        return Role.tagAssigner;
      case 6:
        return Role.tagCreator;
      case 7:
        return Role.privateAlbumCreator;
      case 8:
        return Role.publicAlbumCreator;
      case 256:
        return Role.globalAdmin;
      case 257:
        return Role.debugView;
      case 258:
        return Role.tagVoteModerator;
      case 259:
        return Role.tagModerator;
      case 260:
        return Role.uploadsModerator;
      case 261:
        return Role.publicAlbumModerator;
      case 262:
        return Role.privateAlbumModerator;
      case 263:
        return Role.userTenantModerator;
      case 264:
        return Role.allowsDeletionOfUserTenants;
      case 265:
        return Role.serviceCreateUserTenants;
      case 266:
        return Role.serviceAuthorizeUserTenants;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Role self) {
    switch (self) {
      case Role.anonymous:
        return 0;
      case Role.authorized:
        return 1;
      case Role.privateUploader:
        return 2;
      case Role.publicUploader:
        return 3;
      case Role.voter:
        return 4;
      case Role.tagAssigner:
        return 5;
      case Role.tagCreator:
        return 6;
      case Role.privateAlbumCreator:
        return 7;
      case Role.publicAlbumCreator:
        return 8;
      case Role.globalAdmin:
        return 256;
      case Role.debugView:
        return 257;
      case Role.tagVoteModerator:
        return 258;
      case Role.tagModerator:
        return 259;
      case Role.uploadsModerator:
        return 260;
      case Role.publicAlbumModerator:
        return 261;
      case Role.privateAlbumModerator:
        return 262;
      case Role.userTenantModerator:
        return 263;
      case Role.allowsDeletionOfUserTenants:
        return 264;
      case Role.serviceCreateUserTenants:
        return 265;
      case Role.serviceAuthorizeUserTenants:
        return 266;
    }
  }
}

extension RoleMapperExtension on Role {
  dynamic toValue() {
    RoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Role>(this);
  }
}
