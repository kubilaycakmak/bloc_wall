library photo_hits;

import 'dart:convert';

import 'package:bloc_wall/data/model/serializer/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'photo_hits.g.dart';

abstract class PhotoHits implements Built<PhotoHits, PhotoHitsBuilder> {
  int get id;
  String get pageURL;
  String get type;
  String get tags;
  String get previewURL;
  int get previewWidth;
  int get previewHeight;
  String get webformatURL;
  int get webformatWidth;
  int get webformatHeight;
  String get largeImageURL;
  int get imageWidth;
  int get imageHeight;
  int get views;
  int get downloads;
  int get favorites;
  int get likes;
  int get comments;
  @BuiltValueField(wireName: 'user_id')
  int get userId;
  String get user;
  String get userImageURL;

  PhotoHits._();

  factory PhotoHits([updates(PhotoHitsBuilder b)]) = _$PhotoHits;

  String toJson() {
    return json.encode(serializers.serializeWith(PhotoHits.serializer, this));
  }

  static PhotoHits fromJson(String jsonString) {
    return serializers.deserializeWith(PhotoHits.serializer, json.decode(jsonString));
  }

  static Serializer<PhotoHits> get serializer => _$photoHitsSerializer;
}