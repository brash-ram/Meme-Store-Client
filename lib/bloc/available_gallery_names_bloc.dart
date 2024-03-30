import '/api.dart';
import '/data.dart';
import 'model_bloc.dart';


class AvailableGalleryNamesBloc extends ModelBloc<List<AvailableGalleryName>> {
  AvailableGalleryNamesBloc(this.api);

  final ApiRepository api;

  @override
  Stream<List<AvailableGalleryName>> get dataStream => api.getAvailableGalleryNames();

  @override
  Future<void> fetchNewData() async => api.fetchAvailableGalleryNames();
}
