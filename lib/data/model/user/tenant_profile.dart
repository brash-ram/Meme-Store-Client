
import 'package:dart_mappable/dart_mappable.dart';

import '../../enum/role_enum.dart';
import '../../enum/tenant_origin.dart';
import '../../enum/tenant_type.dart';
import 'tenant.dart';


part 'tenant_profile.mapper.dart';

@MappableClass()
class TenantProfile extends Tenant with TenantProfileMappable {

  TenantProfile({
    required super.id,
    required super.extremistDate,
    required super.foreignAgentDate,
    required super.isRestricted,
    required super.uniqueName,
    required super.displayName,
    required super.origin,
    required super.type,
    required super.roles,
    required this.publicGalleries,
    required this.privateGalleries,
  });

  @MappableField(key: 'public_galleries')
  final List<int> publicGalleries;

  @MappableField(key: 'private_galleries')
  final List<int> privateGalleries;
}