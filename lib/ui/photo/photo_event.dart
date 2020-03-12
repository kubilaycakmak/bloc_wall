part of 'photo_bloc.dart';

class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => throw [];
}
class FetchPhoto extends PhotoEvent{
  final _order;
  final _orientation;

  FetchPhoto(this._order, this._orientation);

  @override
  List<Object> get props => [_order, _orientation];
}
