// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'person_profile.dart';

class PersonProfileMapper extends ClassMapperBase<PersonProfile> {
  PersonProfileMapper._();

  static PersonProfileMapper? _instance;
  static PersonProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonProfileMapper._());
      TenantProfileMapper.ensureInitialized();
      TenantOriginMapper.ensureInitialized();
      TenantTypeMapper.ensureInitialized();
      RoleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PersonProfile';

  static int _$id(PersonProfile v) => v.id;
  static const Field<PersonProfile, int> _f$id = Field('id', _$id);
  static DateTime _$extremistDate(PersonProfile v) => v.extremistDate;
  static const Field<PersonProfile, DateTime> _f$extremistDate =
      Field('extremistDate', _$extremistDate, key: 'extremist_date');
  static DateTime _$foreignAgentDate(PersonProfile v) => v.foreignAgentDate;
  static const Field<PersonProfile, DateTime> _f$foreignAgentDate =
      Field('foreignAgentDate', _$foreignAgentDate, key: 'foreign_agent_date');
  static bool _$isRestricted(PersonProfile v) => v.isRestricted;
  static const Field<PersonProfile, bool> _f$isRestricted =
      Field('isRestricted', _$isRestricted, key: 'is_restricted');
  static String _$uniqueName(PersonProfile v) => v.uniqueName;
  static const Field<PersonProfile, String> _f$uniqueName =
      Field('uniqueName', _$uniqueName, key: 'unique_name');
  static String _$displayName(PersonProfile v) => v.displayName;
  static const Field<PersonProfile, String> _f$displayName =
      Field('displayName', _$displayName, key: 'display_name');
  static TenantOrigin _$origin(PersonProfile v) => v.origin;
  static const Field<PersonProfile, TenantOrigin> _f$origin =
      Field('origin', _$origin);
  static TenantType _$type(PersonProfile v) => v.type;
  static const Field<PersonProfile, TenantType> _f$type = Field('type', _$type);
  static List<Role> _$roles(PersonProfile v) => v.roles;
  static const Field<PersonProfile, List<Role>> _f$roles =
      Field('roles', _$roles);
  static List<int> _$publicGalleries(PersonProfile v) => v.publicGalleries;
  static const Field<PersonProfile, List<int>> _f$publicGalleries =
      Field('publicGalleries', _$publicGalleries, key: 'public_galleries');
  static List<int> _$privateGalleries(PersonProfile v) => v.privateGalleries;
  static const Field<PersonProfile, List<int>> _f$privateGalleries =
      Field('privateGalleries', _$privateGalleries, key: 'private_galleries');

  @override
  final MappableFields<PersonProfile> fields = const {
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

  static PersonProfile _instantiate(DecodingData data) {
    return PersonProfile(
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

  static PersonProfile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PersonProfile>(map);
  }

  static PersonProfile fromJson(String json) {
    return ensureInitialized().decodeJson<PersonProfile>(json);
  }
}

mixin PersonProfileMappable {
  String toJson() {
    return PersonProfileMapper.ensureInitialized()
        .encodeJson<PersonProfile>(this as PersonProfile);
  }

  Map<String, dynamic> toMap() {
    return PersonProfileMapper.ensureInitialized()
        .encodeMap<PersonProfile>(this as PersonProfile);
  }

  @override
  String toString() {
    return PersonProfileMapper.ensureInitialized()
        .stringifyValue(this as PersonProfile);
  }
}
