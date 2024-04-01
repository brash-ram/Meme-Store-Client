import '../data_layer_library.dart';

class TenantProfileBloc extends ModelBloc<TenantProfile> {
  TenantProfileBloc(this.api, [ this.id, ]);

  final ApiRepository api;
  final int? id;

  @override
  Stream<TenantProfile> get dataStream => id == null
    ? api.getMyTenantProfile()
    : api.getTenantProfile(id!);

  @override
  Future<void> fetchNewData() async => id == null
    ? api.fetchMyTenantProfile()
    : api.fetchTenantProfile(id!);
}
