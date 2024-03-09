import 'package:dart_mappable/dart_mappable.dart';

import '../../enums.dart';
import '../model_object.dart';

part 'tenant.mapper.dart';


@MappableClass()
class Tenant extends ModelObject with TenantMappable {
  const Tenant({
    required super.id,
    required this.extremistDate,
    required this.foreignAgentDate,
    required this.isRestricted,
    required this.uniqueName,
    required this.displayName,
    required this.origin,
    required this.type,
    required this.roles,
  });

  @MappableField(key: 'extremist_date')
  final DateTime extremistDate;

  @MappableField(key: 'foreign_agent_date')
  final DateTime foreignAgentDate;

  @MappableField(key: 'is_restricted')
  final bool isRestricted;

  @MappableField(key: 'unique_name')
  final String uniqueName;

  @MappableField(key: 'display_name')
  final String displayName;

  @MappableField(key: 'origin')
  final TenantOrigin origin;

  @MappableField(key: 'type')
  final TenantType type;

  @MappableField(key: 'roles')
  final List<Role> roles;
}
