import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;


void initKiwi(){
  kiwi.Container()..registerInstance(http.Client())
  ..registerFactory((container) => PhotoBloc(container.resolve()))
  ..registerFactory((container) => PhotoRepository());
}