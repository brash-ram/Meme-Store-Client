// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tenant.dart';

class TenantMapper extends ClassMapperBase<Tenant> {
  TenantMapper._();

  static TenantMapper? _instance;
  static TenantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TenantMapper._());
      ModelObjectMapper.ensureInitialized();
      TenantOriginMapper.ensureInitialized();
      TenantTypeMapper.ensureInitialized();
      RoleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Tenant';

  static int _$id(Tenant v) => v.id;
  static const Field<Tenant, int> _f$id = Field('id', _$id);
  static DateTime _$extremistDate(Tenant v) => v.extremistDate;
  static const Field<Tenant, DateTime> _f$extremistDate =
      Field('extremistDate', _$extremistDate, key: 'extremist_date');
  static DateTime _$foreignAgentDate(Tenant v) => v.foreignAgentDate;
  static const Field<Tenant, DateTime> _f$foreignAgentDate =
      Field('foreignAgentDate', _$foreignAgentDate, key: 'foreign_agent_date');
  static bool _$isRestricted(Tenant v) => v.isRestricted;
  static const Field<Tenant, bool> _f$isRestricted =
      Field('isRestricted', _$isRestricted, key: 'is_restricted');
  static String _$uniqueName(Tenant v) => v.uniqueName;
  static const Field<Tenant, String> _f$uniqueName =
      Field('uniqueName', _$uniqueName, key: 'unique_name');
  static String _$displayName(Tenant v) => v.displayName;
  static const Field<Tenant, String> _f$displayName =
      Field('displayName', _$displayName, key: 'display_name');
  static TenantOrigin _$origin(Tenant v) => v.origin;
  static const Field<Tenant, TenantOrigin> _f$origin =
      Field('origin', _$origin);
  static TenantType _$type(Tenant v) => v.type;
  static const Field<Tenant, TenantType> _f$type = Field('type', _$type);
  static List<Role> _$roles(Tenant v) => v.roles;
  static const Field<Tenant, List<Role>> _f$roles = Field('roles', _$roles);

  @override
  final MappableFields<Tenant> fields = const {
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

  static Tenant _instantiate(DecodingData data) {
    return Tenant(
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

  static Tenant fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tenant>(map);
  }

  static Tenant fromJson(String json) {
    return ensureInitialized().decodeJson<Tenant>(json);
  }
}

mixin TenantMappable {
  String toJson() {
    return TenantMapper.ensureInitialized().encodeJson<Tenant>(this as Tenant);
  }

  Map<String, dynamic> toMap() {
    return TenantMapper.ensureInitialized().encodeMap<Tenant>(this as Tenant);
  }

  @override
  String toString() {
    return TenantMapper.ensureInitialized().stringifyValue(this as Tenant);
  }
}
