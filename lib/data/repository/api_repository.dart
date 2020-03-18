import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/model/video/video_all.dart';
import 'package:bloc_wall/data/repository/api_key.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  
  String _lastSearchQuery;

  static const String _pixabayImageBaseURL =
      'https://pixabay.com/api/?key=$API_KEY&safesearch=false';

  static const String _pixabayVideoBaseURL =
      'https://pixabay.com/api/videos/?key=$API_KEY&safesearch=false&pretty=true';
  
  void _cacheValues({String query}){
    _lastSearchQuery = query;
  }

  Future<PhotoAll> fetchPhotos(
    {
      int minWidth = 0,
      int minHeight = 0,
      String colors,
      int userId,
      int perPage = 15,
      bool editorChoice,
      String category,
      String query,
      String imageType,
      String order,
      String orientation
    }
  ) async {
    final urlRaw = _pixabayImageBaseURL +
      '&image_type=$imageType'+
      '&q=$query'+
      '&order=$order'+
      '&orientation=$orientation'+
      '&category=$category'+
      '&editors_choice=$editorChoice'+
      '&per_page=$perPage'+
      '&user_id=$userId'+
      '&min_width=$minWidth'+
      '&min_width=$minHeight'+
      '&colors=$colors';
    _cacheValues(query: query);
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await http.Client().get(urlEncoded);
    if(response.statusCode != 200) throw Exception();
    return PhotoAll.fromJson(response.body);
  }
  Future<PhotoAll> fetchNextResultPage(
    {
      int perPage,
      bool editorChoice,
      String category,
      String query,
      String imageType,
      String order,
      String orientation
    }
    ) async{
    final nextResultPagePhoto = await fetchPhotos(query: _lastSearchQuery, order: order, orientation: orientation, perPage: perPage, category: category, editorChoice: editorChoice, imageType: imageType);
    _cacheValues(query: _lastSearchQuery);
    return nextResultPagePhoto;
  }

  Future<VideoAll> fetchVideos(
    {
      int minWidth = 0,
      int minHeight = 0,
      String userId,
      int perPage = 15,
      bool editorChoice,
      String category,
      String query,
      String videoType,
      String order,
    }
  ) async {
    final urlRaw = _pixabayVideoBaseURL +
      '&video_type=$videoType'+
      '&q=$query'+
      '&order=$order'+
      '&category=$category'+
      '&editors_choice=$editorChoice'+
      '&per_page=$perPage'+
      '&user_id=$userId'+
      '&min_width=$minWidth'+
      '&min_width=$minHeight';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await http.Client().get(urlEncoded);
    if(response.statusCode != 200) throw Exception();
    return VideoAll.fromJson(response.body);
  }
}
