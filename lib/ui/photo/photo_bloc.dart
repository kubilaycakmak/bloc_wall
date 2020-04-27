import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  ApiRepository _apiRepository;
  PhotoBloc(this._apiRepository) : super();
  int counter = 15;
  int page = 1;

  @override
  PhotoState get initialState => PhotoIsNotList();

  void fetchNextResultPage(
      {String color,
      String order,
      String orientation,
      String query,
      String category,
      bool editorChoice,
      String imageType}) {
    add(FetchNextResultPage(
        color: color,
        page: page,
        order: order,
        orientation: orientation,
        query: query,
        category: category,
        editorChoice: editorChoice,
        imageType: imageType));
  }

  void fetchResultPage(
      {int perPage,
      String colors,
      int page,
      String order,
      String orientation,
      String query,
      String category,
      bool editorChoice,
      String imageType}) {
    add(FetchPhoto(perPage, colors, editorChoice, category, imageType, query,
        order, orientation));
  }

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is FetchPhoto) {
      print('event query: ${event._query}');
      yield PhotoIsLoading();
      try {
        PhotoAll photoAll = await _apiRepository.fetchPhotos(
            perPage: event._perPage,
            colors: event._color,
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
    } else if (event is FetchNextResultPage) {
      try {
        counter += 25;
        if (counter >= 200) {
          counter = 15;
          page++;
          yield PhotoIsNotList();
        }
        final nextPageResult = await _apiRepository.fetchNextResultPage(
            colors: event.color,
            query: event.query,
            page: page,
            perPage: counter,
            order: event.order,
            orientation: event.orientation,
            category: event.category,
            editorChoice: event.editorChoice,
            imageType: event.imageType);
        yield PhotoIsLoaded(nextPageResult);
      } catch (e) {
        print(e);
      }
    }
  }
}
