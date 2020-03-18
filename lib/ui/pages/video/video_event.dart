part of 'video_bloc.dart';

class VideoEvent extends Equatable{
  const VideoEvent();
  @override
  List<Object> get props => throw [];
}
class FetchVideo extends VideoEvent{
  final _query;
  final _userId; //search user's videos
  final _videoType;
  final _category;
  final _minWidth;
  final _minHeight;
  final _editorChoice;
  final _order;

  FetchVideo(this._query, this._userId, this._videoType, this._category, this._minWidth, this._minHeight, this._editorChoice, this._order);
  @override
  List<Object> get props => throw [_query, _userId, _videoType, _category, _minWidth, _minHeight, _editorChoice, _order];

}
class FetchNextResultPage extends VideoEvent{
  
}
