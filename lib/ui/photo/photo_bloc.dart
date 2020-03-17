import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoRepository _photoRepository;
  PhotoBloc(this._photoRepository);
  int counter = 15;

  @override
  PhotoState get initialState => PhotoIsNotList();

  void fetchNextResultPage(String order, String orientation, String query, String category, bool editorChoice, String imageType){
    add(FetchNextResultPage(order: order, orientation: orientation, query: query, category: category, editorChoice: editorChoice, imageType: imageType));
  }

  void fetchResultPage(String order, String orientation, String query, String category, bool editorChoice, String imageType){
    add(FetchPhoto(editorChoice, category, imageType, query, order, orientation));
  }
  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is FetchPhoto) {
      yield PhotoIsLoading();
      try {
        PhotoAll photoAll = await _photoRepository.fetchPhotos(
          editorChoice: event._editorChoice,
            category: event._category,
            imageType: event._imageType,
            query: event._query,
            order: event._order,
            orientation: event._orientation);
        yield PhotoIsLoaded(photoAll);
      } catch (_) {
        yield PhotoIsNotLoaded();
      }
    }else if(event is FetchNextResultPage){
      try {
        counter += 25;
        final nextPageResult = await _photoRepository.fetchNextResultPage(perPage: counter, order: event.order, orientation: event.orientation, category: event.category, editorChoice: event.editorChoice, imageType: event.imageType);
        yield PhotoIsLoaded(nextPageResult);
      }catch(e){
        print(e);
      }
    }
  }
}
