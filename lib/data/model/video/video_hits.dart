library video_hits;

import 'dart:convert';

import 'package:bloc_wall/data/model/serializer/serializers.dart';
import 'package:bloc_wall/data/model/video/video_videos.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_hits.g.dart';

abstract class VideoHits implements Built<VideoHits, VideoHitsBuilder> {
  int get id;
  String get pageURL;
  String get type;
  String get tags;
  int get duration;
  @BuiltValueField(wireName: 'picture_id')
  int get pictureId;
  VideoVideos get videos;
  int get views;
  int get downloads;
  int get favorites;
  int get likes;
  int get comments;
  @BuiltValueField(wireName: 'user_id')
  int get userId;
  String get user;
  String get userImageURL;

  VideoHits._();

  factory VideoHits([updates(VideoHitsBuilder b)]) = _$VideoHits;

  String toJson() {
    return json.encode(serializers.serializeWith(VideoHits.serializer, this));
  }

  static VideoHits fromJson(String jsonString) {
    return serializers.deserializeWith(
        VideoHits.serializer, json.decode(jsonString));
  }

  static Serializer<VideoHits> get serializer => _$videoHitsSerializer;
}
