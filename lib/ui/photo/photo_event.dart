part of 'photo_bloc.dart';

class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => throw [];
}

class FetchPhoto extends PhotoEvent {
  final _editorChoice;
  final _category;
  final _imageType;
  final _query;
  final _order;
  final _orientation;

  FetchPhoto(this._editorChoice, this._category, this._imageType, this._query,
      this._order, this._orientation);

  @override
  List<Object> get props =>
      [_editorChoice, _category, _imageType, _query, _order, _orientation];
}

class FetchNextResultPage extends PhotoEvent {
  final page;
  final editorChoice;
  final category;
  final imageType;
  final query;
  final order;
  final orientation;

  FetchNextResultPage(
      {this.page,
      this.editorChoice,
      this.category,
      this.imageType,
      this.query,
      this.order,
      this.orientation});

  @override
  List<Object> get props =>
      [page, editorChoice, category, imageType, query, order, orientation];
}
