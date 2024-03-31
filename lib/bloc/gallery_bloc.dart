import '../data_layer_library.dart';

class GalleryBloc extends ModelBloc<Gallery> {
  GalleryBloc(this.api, this.id);

  final ApiRepository api;
  final int id;

  @override
  Stream<Gallery> get dataStream => api.getGallery(id);

  @override
  Future<void> fetchNewData() async => api.fetchGallery(id);
}
