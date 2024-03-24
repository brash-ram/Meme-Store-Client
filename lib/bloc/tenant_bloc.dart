import '/api.dart';
import '/data.dart';
import 'model_bloc.dart';


class TenantBloc extends ModelBloc<Tenant> {
  TenantBloc(this.api, this.id);

  final ApiRepository api;
  final int id;

  @override
  Stream<Tenant> get dataStream => api.getTenant(id);

  @override
  Future<void> fetchNewData() async => api.fetchTenant(id);
}
