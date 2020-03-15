library video_size;

import 'dart:convert';

import 'package:bloc_wall/data/model/serializer/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_size.g.dart';

abstract class VideoSize implements Built<VideoSize, VideoSizeBuilder> {
  String get url;
  int get width;
  int get height;
  int get size;

  VideoSize._();

  factory VideoSize([updates(VideoSizeBuilder b)]) = _$VideoSize;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoSize.serializer, this));
  }

  static VideoSize fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoSize.serializer, json.decode(jsonString));
  }

  static Serializer<VideoSize> get serializer => _$videoSizeSerializer;
}
