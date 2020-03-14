part of 'photo_bloc.dart';

class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => throw [];
}
class FetchPhoto extends PhotoEvent{
  final _query;
  final _order;
  final _orientation;

  FetchPhoto(this._query, this._order, this._orientation);

  @override
  List<Object> get props => [_query,_order, _orientation];
}
