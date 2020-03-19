part of 'video_bloc.dart';

class VideoState extends Equatable{
  const VideoState();
  @override
  List<Object> get props => throw [];
}
class VideoInitial extends VideoState {}
class VideoIsLoading extends VideoState{}
class VideoIsLoaded extends VideoState{
  final _video;
  VideoAll get getVideo => _video;
  VideoIsLoaded(this._video);
  @override
  List<Object> get props => [_video];
}
class VideoIsNotLoaded extends VideoState{}