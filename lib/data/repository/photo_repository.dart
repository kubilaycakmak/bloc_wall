import 'package:bloc_wall/data/model/photo/photo_all.dart';
// import 'package:bloc_wall/data/model/video/video_all.dart';
import 'package:bloc_wall/data/repository/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const int MAX_SEARCH_RESULT = 50;

class PhotoRepository {
  static const String _pixabayImageBaseURL =
      'https://pixabay.com/api/?key=$API_KEY&per_page=$MAX_SEARCH_RESULT&editor_choice=true';
  // static const String _pixabayVideoBaseURL =
  //     'https://pixabay.com/videos/?key=$API_KEY';

  Future<PhotoAll> fetchPhotos(
      {String query,
      String imageType,
      @required String order,
      @required String orientation}) async {
    final urlRaw = _pixabayImageBaseURL +
        '&image_type=$imageType&q=$query&order=$order&orientation=$orientation';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await http.Client().get(urlEncoded);

    if (response.statusCode != 200) throw Exception();
    return PhotoAll.fromJson(response.body);
  }

  // Future<VideoAll> fetchVideos() async{

  // }
}
