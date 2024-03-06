// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'role_enum.dart';

class RoleEnumMapper extends EnumMapper<RoleEnum> {
  RoleEnumMapper._();

  static RoleEnumMapper? _instance;
  static RoleEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleEnumMapper._());
    }
    return _instance!;
  }

  static RoleEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  RoleEnum decode(dynamic value) {
    switch (value) {
      case 'anonymous':
        return RoleEnum.anonymous;
      case 'authorized':
        return RoleEnum.authorized;
      case 'privateUploader':
        return RoleEnum.privateUploader;
      case 'publicUploader':
        return RoleEnum.publicUploader;
      case 'voter':
        return RoleEnum.voter;
      case 'tagAssigner':
        return RoleEnum.tagAssigner;
      case 'tagCreator':
        return RoleEnum.tagCreator;
      case 'privateAlbumCreator':
        return RoleEnum.privateAlbumCreator;
      case 'publicAlbumCreator':
        return RoleEnum.publicAlbumCreator;
      case 'globalAdmin':
        return RoleEnum.globalAdmin;
      case 'debugView':
        return RoleEnum.debugView;
      case 'tagVoteModerator':
        return RoleEnum.tagVoteModerator;
      case 'tagModerator':
        return RoleEnum.tagModerator;
      case 'uploadsModerator':
        return RoleEnum.uploadsModerator;
      case 'publicAlbumModerator':
        return RoleEnum.publicAlbumModerator;
      case 'privateAlbumModerator':
        return RoleEnum.privateAlbumModerator;
      case 'userTenantModerator':
        return RoleEnum.userTenantModerator;
      case 'allowsDeletionOfUserTenants':
        return RoleEnum.allowsDeletionOfUserTenants;
      case 'serviceCreateUserTenants':
        return RoleEnum.serviceCreateUserTenants;
      case 'serviceAuthorizeUserTenants':
        return RoleEnum.serviceAuthorizeUserTenants;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(RoleEnum self) {
    switch (self) {
      case RoleEnum.anonymous:
        return 'anonymous';
      case RoleEnum.authorized:
        return 'authorized';
      case RoleEnum.privateUploader:
        return 'privateUploader';
      case RoleEnum.publicUploader:
        return 'publicUploader';
      case RoleEnum.voter:
        return 'voter';
      case RoleEnum.tagAssigner:
        return 'tagAssigner';
      case RoleEnum.tagCreator:
        return 'tagCreator';
      case RoleEnum.privateAlbumCreator:
        return 'privateAlbumCreator';
      case RoleEnum.publicAlbumCreator:
        return 'publicAlbumCreator';
      case RoleEnum.globalAdmin:
        return 'globalAdmin';
      case RoleEnum.debugView:
        return 'debugView';
      case RoleEnum.tagVoteModerator:
        return 'tagVoteModerator';
      case RoleEnum.tagModerator:
        return 'tagModerator';
      case RoleEnum.uploadsModerator:
        return 'uploadsModerator';
      case RoleEnum.publicAlbumModerator:
        return 'publicAlbumModerator';
      case RoleEnum.privateAlbumModerator:
        return 'privateAlbumModerator';
      case RoleEnum.userTenantModerator:
        return 'userTenantModerator';
      case RoleEnum.allowsDeletionOfUserTenants:
        return 'allowsDeletionOfUserTenants';
      case RoleEnum.serviceCreateUserTenants:
        return 'serviceCreateUserTenants';
      case RoleEnum.serviceAuthorizeUserTenants:
        return 'serviceAuthorizeUserTenants';
    }
  }
}

extension RoleEnumMapperExtension on RoleEnum {
  String toValue() {
    RoleEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<RoleEnum>(this) as String;
  }
}
