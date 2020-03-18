library video_all;

import 'dart:convert';

import 'package:bloc_wall/data/model/serializer/serializers.dart';
import 'package:bloc_wall/data/model/video/video_hits.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_all.g.dart';

abstract class VideoAll implements Built<VideoAll, VideoAllBuilder> {
  int get total;
  int get totalHits;
  BuiltList<VideoHits> get hits;

  VideoAll._();

  factory VideoAll([updates(VideoAllBuilder b)]) = _$VideoAll;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoAll.serializer, this));
  }

  static VideoAll fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoAll.serializer, json.decode(jsonString));
  }

  static Serializer<VideoAll> get serializer => _$videoAllSerializer;
}
