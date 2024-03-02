import 'package:dart_mappable/dart_mappable.dart';
part 'tenant_origin.mapper.dart';
@MappableEnum()
enum TenantOrigin {
  internalSystem('internal/system'),
  internalUser('internal/user'),
  internalService('internal/service'),
  externalTg('external/tg');

  const TenantOrigin(this.id);

  final String id;


  static TenantOrigin getFromId(String id) {
    for (final role in TenantOrigin.values) {
      if (role.id == id) {
        return role;
      }
    }
    return TenantOrigin.internalSystem;
  }
}
