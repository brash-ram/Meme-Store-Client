import '../data_layer_library.dart';

class TenantProfileBloc extends ModelBloc<TenantProfile> {
  TenantProfileBloc(this.api, this.id);

  final ApiRepository api;
  final int id;

  @override
  Stream<TenantProfile> get dataStream => api.getTenantProfile(id);

  @override
  Future<void> fetchNewData() async => api.fetchTenantProfile(id);
}
