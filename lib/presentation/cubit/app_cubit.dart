import 'package:bloc/bloc.dart';
import 'package:watchit/data/model/video_model.dart';
import 'package:watchit/data/repository/app_repository.dart';
import 'package:watchit/presentation/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{

  AppRepository _repository;
  AppCubit(this._repository): super(AppInitState());

  List<VideoModel> videos = [];

  void getVideos(){
    videos = _repository.getVideosByQuery('');
    emit(GetUpdatedVideosState());
  }

  void getSearchedVideos(String query){
    videos = _repository.getVideosByQuery(query);
    emit(GetUpdatedVideosState());
  }
}