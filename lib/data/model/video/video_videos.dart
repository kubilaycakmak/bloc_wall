library video_videos;
import 'dart:convert';
import 'package:bloc_wall/data/model/serializer/serializers.dart';
import 'package:bloc_wall/data/model/video/video_size.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_videos.g.dart';

abstract class VideoVideos implements Built<VideoVideos, VideoVideosBuilder> {
  VideoSize get large;
  VideoSize get medium;
  VideoSize get small;
  VideoSize get tiny;

  VideoVideos._();

  factory VideoVideos([updates(VideoVideosBuilder b)]) = _$VideoVideos;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoVideos.serializer, this));
  }

  static VideoVideos fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoVideos.serializer, json.decode(jsonString));
  }

  static Serializer<VideoVideos> get serializer => _$videoVideosSerializer;
}
