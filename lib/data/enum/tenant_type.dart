import 'package:dart_mappable/dart_mappable.dart';
part 'tenant_type.mapper.dart';
@MappableEnum()
enum TenantType {
  guest,
  user,
  service;
}

