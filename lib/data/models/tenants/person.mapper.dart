// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'person.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();

  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
      TenantMapper.ensureInitialized();
      TenantOriginMapper.ensureInitialized();
      TenantTypeMapper.ensureInitialized();
      RoleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Person';

  static int _$id(Person v) => v.id;
  static const Field<Person, int> _f$id = Field('id', _$id);
  static DateTime _$extremistDate(Person v) => v.extremistDate;
  static const Field<Person, DateTime> _f$extremistDate =
      Field('extremistDate', _$extremistDate, key: 'extremist_date');
  static DateTime _$foreignAgentDate(Person v) => v.foreignAgentDate;
  static const Field<Person, DateTime> _f$foreignAgentDate =
      Field('foreignAgentDate', _$foreignAgentDate, key: 'foreign_agent_date');
  static bool _$isRestricted(Person v) => v.isRestricted;
  static const Field<Person, bool> _f$isRestricted =
      Field('isRestricted', _$isRestricted, key: 'is_restricted');
  static String _$uniqueName(Person v) => v.uniqueName;
  static const Field<Person, String> _f$uniqueName =
      Field('uniqueName', _$uniqueName, key: 'unique_name');
  static String _$displayName(Person v) => v.displayName;
  static const Field<Person, String> _f$displayName =
      Field('displayName', _$displayName, key: 'display_name');
  static TenantOrigin _$origin(Person v) => v.origin;
  static const Field<Person, TenantOrigin> _f$origin =
      Field('origin', _$origin);
  static TenantType _$type(Person v) => v.type;
  static const Field<Person, TenantType> _f$type = Field('type', _$type);
  static List<Role> _$roles(Person v) => v.roles;
  static const Field<Person, List<Role>> _f$roles = Field('roles', _$roles);

  @override
  final MappableFields<Person> fields = const {
    #id: _f$id,
    #extremistDate: _f$extremistDate,
    #foreignAgentDate: _f$foreignAgentDate,
    #isRestricted: _f$isRestricted,
    #uniqueName: _f$uniqueName,
    #displayName: _f$displayName,
    #origin: _f$origin,
    #type: _f$type,
    #roles: _f$roles,
  };

  static Person _instantiate(DecodingData data) {
    return Person(
        id: data.dec(_f$id),
        extremistDate: data.dec(_f$extremistDate),
        foreignAgentDate: data.dec(_f$foreignAgentDate),
        isRestricted: data.dec(_f$isRestricted),
        uniqueName: data.dec(_f$uniqueName),
        displayName: data.dec(_f$displayName),
        origin: data.dec(_f$origin),
        type: data.dec(_f$type),
        roles: data.dec(_f$roles));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Person>(map);
  }

  static Person fromJson(String json) {
    return ensureInitialized().decodeJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper.ensureInitialized().encodeJson<Person>(this as Person);
  }

  Map<String, dynamic> toMap() {
    return PersonMapper.ensureInitialized().encodeMap<Person>(this as Person);
  }

  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }
}
