import 'tenant_profile.dart';

class PersonProfile extends TenantProfile {
  PersonProfile({
    required super.id,
    required super.extremistDate,
    required super.foreignAgentDate,
    required super.isRestricted,
    required super.uniqueName,
    required super.displayName,
    required super.origin,
    required super.type,
    required super.roles,
    required super.publicGalleries,
    required super.privateGalleries,
  });

}
