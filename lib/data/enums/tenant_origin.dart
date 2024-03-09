import 'package:dart_mappable/dart_mappable.dart';

part 'tenant_origin.mapper.dart';


@MappableEnum(mode: ValuesMode.named)
enum TenantOrigin {
  @MappableValue('internal/system')
  internalSystem('internal/system'),

  @MappableValue('internal/user')
  internalUser('internal/user'),

  @MappableValue('internal/service')
  internalService('internal/service'),

  @MappableValue('external/tg')
  externalTelegram('external/tg'),
  ;

  const TenantOrigin(this.id);

  final String id;

  /// Assumes ID is always correct and valid
  static TenantOrigin fromId(String id) =>
    values.firstWhere((element) => element.id == id);
}
