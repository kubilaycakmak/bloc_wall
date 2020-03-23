import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:bloc_wall/ui/global/theme/bloc/theme_bloc.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((container) => PhotoBloc(container.resolve()))
    ..registerFactory((container) => ThemeBloc())
    ..registerFactory((container) => ApiRepository());
}
