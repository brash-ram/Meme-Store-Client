import 'tenant.dart';

class Person extends Tenant {

  Person({
    required super.id,
    required super.extremistDate,
    required super.foreignAgentDate,
    required super.isRestricted,
    required super.uniqueName,
    required super.displayName,
    required super.origin,
    required super.type,
    required super.roles,
  });

}
