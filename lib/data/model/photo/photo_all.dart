library photo_all;

import 'dart:convert';
import 'package:bloc_wall/data/model/photo/photo_hits.dart';
import 'package:bloc_wall/data/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'photo_all.g.dart';

abstract class PhotoAll implements Built<PhotoAll, PhotoAllBuilder> {
  int get total;
  int get totalHits;
  BuiltList<PhotoHits> get hits;

  PhotoAll._();

  factory PhotoAll([updates(PhotoAllBuilder b)]) = _$PhotoAll;

  String toJson() {
    return json.encode(serializers.serializeWith(PhotoAll.serializer, this));
  }

  static PhotoAll fromJson(String jsonString) {
    return serializers.deserializeWith(
        PhotoAll.serializer, json.decode(jsonString));
  }

  static Serializer<PhotoAll> get serializer => _$photoAllSerializer;
}
