import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/api_key.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  String _lastSearchQuery;

  static const String _pixabayImageBaseURL =
      'https://pixabay.com/api/?key=$API_KEY&safesearch=true&editors_choice=true';

  void _cacheValues({String query}) {
    _lastSearchQuery = query;
  }

  Future<PhotoAll> fetchPhotos(
      {int page = 1,
      int minWidth = 0,
      int minHeight = 0,
      String colors,
      int userId,
      int perPage = 15,
      bool editorChoice = true,
      String category,
      String query,
      String imageType,
      String order,
      String orientation}) async {
    final urlRaw = _pixabayImageBaseURL +
        '&page=$page' +
        '&image_type=$imageType' +
        '&q=$query' +
        '&order=$order' +
        '&orientation=$orientation' +
        '&category=$category' +
        '&editors_choice=$editorChoice' +
        '&per_page=$perPage' +
        '&user_id=$userId' +
        '&min_width=$minWidth' +
        '&min_width=$minHeight' +
        '&colors=$colors';
    _cacheValues(query: query);
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await http.Client().get(urlEncoded);
    print(urlRaw);
    if (response.statusCode != 200) print('fetchError');
    return PhotoAll.fromJson(response.body);
  }

  Future<PhotoAll> fetchNextResultPage(
      {int page,
      int perPage,
      bool editorChoice = true,
      String category,
      String query,
      String colors,
      String imageType,
      String order,
      String orientation}) async {
    final nextResultPagePhoto = await fetchPhotos(
        page: page,
        query: _lastSearchQuery,
        order: order,
        orientation: orientation,
        perPage: perPage,
        colors: colors,
        category: category,
        editorChoice: editorChoice,
        imageType: imageType);
    _cacheValues(query: _lastSearchQuery);
    return nextResultPagePhoto;
  }
}
