import '/api.dart';
import '/data.dart';
import 'model_bloc.dart';


class MemeBloc extends ModelBloc<Meme> {
  MemeBloc(this.api, this.galleryId, this.memeId);

  final ApiRepository api;
  final int galleryId;
  final int memeId;

  @override
  Stream<Meme> get dataStream => api.getMeme(galleryId, memeId);
  
  @override
  Future<void> refreshData() async => api.fetchMeme(galleryId, memeId);
}
