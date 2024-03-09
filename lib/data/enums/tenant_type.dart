import 'package:dart_mappable/dart_mappable.dart';

part 'tenant_type.mapper.dart';


@MappableEnum(mode: ValuesMode.named)
enum TenantType {
  guest,
  user,
  service,
  ;
}
