part of 'photo_bloc.dart';

class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => throw [];
}

class PhotoIsNotList extends PhotoState {}

class PhotoIsLoading extends PhotoState {}

class PhotoIsLoaded extends PhotoState {
  final _photo;
  PhotoAll get getPhoto => _photo;
  PhotoIsLoaded(this._photo);

  @override
  List<Object> get props => [_photo];
}

class PhotoIsNotLoaded extends PhotoState {}

class PhotoPageEnd extends PhotoState {
  final _page;
  PhotoPageEnd(this._page);
  @override
  List<Object> get props => [_page];
}
