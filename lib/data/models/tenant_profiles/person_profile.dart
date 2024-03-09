import 'package:dart_mappable/dart_mappable.dart';

import '../../enums.dart';
import 'tenant_profile.dart';

part 'person_profile.mapper.dart';


@MappableClass()
class PersonProfile extends TenantProfile with PersonProfileMappable {
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
