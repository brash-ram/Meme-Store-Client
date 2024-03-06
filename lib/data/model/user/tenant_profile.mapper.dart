// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tenant_profile.dart';

class TenantProfileMapper extends ClassMapperBase<TenantProfile> {
  TenantProfileMapper._();

  static TenantProfileMapper? _instance;
  static TenantProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TenantProfileMapper._());
      TenantMapper.ensureInitialized();
      TenantOriginMapper.ensureInitialized();
      TenantTypeMapper.ensureInitialized();
      RoleEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TenantProfile';

  static int _$id(TenantProfile v) => v.id;
  static const Field<TenantProfile, int> _f$id = Field('id', _$id);
  static DateTime _$extremistDate(TenantProfile v) => v.extremistDate;
  static const Field<TenantProfile, DateTime> _f$extremistDate =
      Field('extremistDate', _$extremistDate, key: 'extremist_date');
  static DateTime _$foreignAgentDate(TenantProfile v) => v.foreignAgentDate;
  static const Field<TenantProfile, DateTime> _f$foreignAgentDate =
      Field('foreignAgentDate', _$foreignAgentDate, key: 'foreign_agent_date');
  static bool _$isRestricted(TenantProfile v) => v.isRestricted;
  static const Field<TenantProfile, bool> _f$isRestricted =
      Field('isRestricted', _$isRestricted, key: 'is_restricted');
  static String _$uniqueName(TenantProfile v) => v.uniqueName;
  static const Field<TenantProfile, String> _f$uniqueName =
      Field('uniqueName', _$uniqueName, key: 'unique_name');
  static String _$displayName(TenantProfile v) => v.displayName;
  static const Field<TenantProfile, String> _f$displayName =
      Field('displayName', _$displayName, key: 'display_name');
  static TenantOrigin _$origin(TenantProfile v) => v.origin;
  static const Field<TenantProfile, TenantOrigin> _f$origin =
      Field('origin', _$origin);
  static TenantType _$type(TenantProfile v) => v.type;
  static const Field<TenantProfile, TenantType> _f$type = Field('type', _$type);
  static List<RoleEnum> _$roles(TenantProfile v) => v.roles;
  static const Field<TenantProfile, List<RoleEnum>> _f$roles =
      Field('roles', _$roles);
  static List<int> _$publicGalleries(TenantProfile v) => v.publicGalleries;
  static const Field<TenantProfile, List<int>> _f$publicGalleries =
      Field('publicGalleries', _$publicGalleries, key: 'public_galleries');
  static List<int> _$privateGalleries(TenantProfile v) => v.privateGalleries;
  static const Field<TenantProfile, List<int>> _f$privateGalleries =
      Field('privateGalleries', _$privateGalleries, key: 'private_galleries');

  @override
  final MappableFields<TenantProfile> fields = const {
    #id: _f$id,
    #extremistDate: _f$extremistDate,
    #foreignAgentDate: _f$foreignAgentDate,
    #isRestricted: _f$isRestricted,
    #uniqueName: _f$uniqueName,
    #displayName: _f$displayName,
    #origin: _f$origin,
    #type: _f$type,
    #roles: _f$roles,
    #publicGalleries: _f$publicGalleries,
    #privateGalleries: _f$privateGalleries,
  };

  static TenantProfile _instantiate(DecodingData data) {
    return TenantProfile(
        id: data.dec(_f$id),
        extremistDate: data.dec(_f$extremistDate),
        foreignAgentDate: data.dec(_f$foreignAgentDate),
        isRestricted: data.dec(_f$isRestricted),
        uniqueName: data.dec(_f$uniqueName),
        displayName: data.dec(_f$displayName),
        origin: data.dec(_f$origin),
        type: data.dec(_f$type),
        roles: data.dec(_f$roles),
        publicGalleries: data.dec(_f$publicGalleries),
        privateGalleries: data.dec(_f$privateGalleries));
  }

  @override
  final Function instantiate = _instantiate;

  static TenantProfile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TenantProfile>(map);
  }

  static TenantProfile fromJson(String json) {
    return ensureInitialized().decodeJson<TenantProfile>(json);
  }
}

mixin TenantProfileMappable {
  String toJson() {
    return TenantProfileMapper.ensureInitialized()
        .encodeJson<TenantProfile>(this as TenantProfile);
  }

  Map<String, dynamic> toMap() {
    return TenantProfileMapper.ensureInitialized()
        .encodeMap<TenantProfile>(this as TenantProfile);
  }

  @override
  String toString() {
    return TenantProfileMapper.ensureInitialized()
        .stringifyValue(this as TenantProfile);
  }
}
