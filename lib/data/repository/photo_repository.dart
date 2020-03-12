import 'package:bloc_wall/data/model/photo_all.dart';
import 'package:bloc_wall/data/repository/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const int MAX_SEARCH_RESULT = 5;

class PhotoRepository{
  final String _pixabayBaseURL = 'https://pixabay.com/api/?key=$API_KEY&per_page=$MAX_SEARCH_RESULT&editor_choice=true';
  
  Future<PhotoAll> fetchHits({String query, @required String order, @required String orientation}) async{
    final urlRaw = _pixabayBaseURL + '&q=$query&order=$order&orientation=$orientation';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await http.Client().get(urlEncoded);

    if(response.statusCode != 200)
      throw Exception();
    return PhotoAll.fromJson(response.body);
  }
}