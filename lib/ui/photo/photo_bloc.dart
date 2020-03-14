import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_wall/data/model/photo_all.dart';
import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:equatable/equatable.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoRepository _photoRepository;
  PhotoBloc(this._photoRepository);

  @override
  PhotoState get initialState => PhotoIsNotList();

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if(event is FetchPhoto){
      yield PhotoIsLoading();
      try {
        PhotoAll photoAll = await _photoRepository.fetchHits(query: event._query, order: event._order, orientation: event._orientation);
        
        yield PhotoIsLoaded(photoAll);
      } catch (_) {
        yield PhotoIsNotLoaded();
      }
    }
  }
}
