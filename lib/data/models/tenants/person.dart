import 'package:dart_mappable/dart_mappable.dart';

import '../../enums.dart';
import 'tenant.dart';

part 'person.mapper.dart';


@MappableClass()
class Person extends Tenant with PersonMappable {
  const Person({
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
