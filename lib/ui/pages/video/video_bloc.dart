import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_wall/data/model/video/video_all.dart';
import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:equatable/equatable.dart';
part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  ApiRepository _apiRepository;
  VideoBloc(this._apiRepository) : super();
  @override
  VideoState get initialState => VideoInitial();
  int counter = 15;

  void fetchNextResultPage(){
    add(FetchNextResultPage());
  }

  void fetchResultPage(int minWidth,
      int minHeight,
      String userId,
      int perPage,
      bool editorChoice,
      String category,
      String query,
      String videoType,
      String order,){
    add(FetchVideo(query, userId, videoType, category, minWidth, minHeight, editorChoice, order));
  }
  
  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if(event is FetchVideo){
      yield VideoIsLoading();
      print('VideoIsLoading');
      try{
        print('object');
        VideoAll videoAll = await _apiRepository.fetchVideos(
          category: event._category,
          editorChoice: event._editorChoice,
          minHeight: event._minHeight,
          minWidth: event._minHeight,
          order: event._order,
          query: event._query,
          userId: event._userId,
          videoType: event._videoType
        );
        print('asd');
        yield VideoIsLoaded(videoAll);
      }catch(_){
        print('VideoIsNotLoaded');
        yield VideoIsNotLoaded();
      }
    }
    if(event is FetchNextResultPage){
      try{
        counter += 25;
        final nextResultPage = await _apiRepository.fetchNextResultPage();
        yield VideoIsLoaded(nextResultPage);
      }catch (_){
        throw Exception();
      }
    }
  }
}
