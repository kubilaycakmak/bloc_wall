import 'package:bloc_wall/data/model/photo/photo_all.dart';
// import 'package:bloc_wall/data/model/video/video_all.dart';
import 'package:bloc_wall/data/repository/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PhotoRepository {
  
  String _lastSearchQuery;

  static const String _pixabayImageBaseURL =
      'https://pixabay.com/api/?key=$API_KEY&safesearch=true';
  // static const String _pixabayVideoBaseURL =
  //     'https://pixabay.com/videos/?key=$API_KEY';
  void _cacheValues({String query}){
    _lastSearchQuery = query;
  }
  Future<PhotoAll> fetchPhotos({
      int perPage = 15,
      bool editorChoice,
      String category,
      String query,
      String imageType,
      @required String order,
      @required String orientation}) async {
    final urlRaw = _pixabayImageBaseURL +
        '&image_type=$imageType&q=$query&order=$order&orientation=$orientation&category=$category&editors_choice=$editorChoice&per_page=$perPage';
        print(urlRaw);
    _cacheValues(query: query);
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await http.Client().get(urlEncoded);

    if (response.statusCode != 200) throw Exception();
    return PhotoAll.fromJson(response.body);
  }
  Future<PhotoAll> fetchNextResultPage({int perPage, @required String order,
      @required String orientation, bool editorChoice,
      String category,
      String query,
      String imageType}) async{
    if(_lastSearchQuery == null){
       throw Exception();
    }
     final nextPageSearchResult = await fetchPhotos(query: _lastSearchQuery, order: order, orientation: orientation, perPage: perPage, category: category, editorChoice: editorChoice, imageType: imageType);
    _cacheValues(query: _lastSearchQuery);
    return nextPageSearchResult;
  }
}
