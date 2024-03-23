import '/api.dart';
import '/data.dart';
import 'model_bloc.dart';


class MemeTagsBloc extends ModelBloc<List<MemeTag>> {
  MemeTagsBloc(this.api, this.galleryId, this.memeId);

  final ApiRepository api;
  final int galleryId;
  final int memeId;

  @override
  Stream<List<MemeTag>> get dataStream => api.getMemeTags(galleryId, memeId);

  @override
  Future<void> fetchNewData() async => api.fetchMemeTags(galleryId, memeId);
}
