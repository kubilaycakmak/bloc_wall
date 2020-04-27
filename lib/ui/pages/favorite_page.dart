import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:bloc_wall/ui/pages/animation/fade_animation.dart';
import 'package:bloc_wall/ui/pages/wallpaper_page.dart';
import 'package:bloc_wall/ui/pages/widget/custom_card.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();

  List<PreloadPageController> controllers = [];

  @override
  void initState() {
    controllers = [
      PreloadPageController(viewportFraction: 0.6, initialPage: 3),
      PreloadPageController(viewportFraction: 0.6, initialPage: 3),
      PreloadPageController(viewportFraction: 0.6, initialPage: 3),
      PreloadPageController(viewportFraction: 0.6, initialPage: 3),
      PreloadPageController(viewportFraction: 0.6, initialPage: 3),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(ApiRepository()),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            FadeAnimation(0.3, _buildBlocBuilder()),
          ],
        ),
      ),
    );
  }

  BlocBuilder<PhotoBloc, PhotoState> _buildBlocBuilder() {
    return BlocBuilder<PhotoBloc, PhotoState>(
      bloc: _photoBloc,
      builder: (context, state) {
        if (state is PhotoIsNotList) {
          print('PhotoIsNotList');
          _photoBloc.add(FetchPhoto(
              25, '', false, '', 'photo', '', 'latest', 'horizontal'));
        }
        if (state is PhotoIsLoading) {
          print('PhotoIsLoading');
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PhotoIsLoaded) {
          return _buildPreloadPage(state.getPhoto);
        }
        if (state is PhotoIsNotLoaded) {
          print('PhotoIsNotLoaded');
        }
        return Center(child: Text('error'));
      },
    );
  }

  _animatePage(int page, int index) {
    for (int i = 0; i < 5; i++) {
      if (i != index) {
        controllers[i].animateToPage(page,
            duration: Duration(milliseconds: 250), curve: Curves.linear);
      }
    }
  }

  Widget _buildPreloadPage(PhotoAll photoAll) {
    return PreloadPageView.builder(
        controller:
            PreloadPageController(viewportFraction: 0.7, initialPage: 3),
        itemCount: 5,
        preloadPagesCount: 5,
        itemBuilder: (context, mainIndex) {
          return PreloadPageView.builder(
            itemCount: 5,
            preloadPagesCount: 5,
            controller: controllers[mainIndex],
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            onPageChanged: (page) {
              _animatePage(page, mainIndex);
            },
            itemBuilder: (context, index) {
              var hitIndex = (mainIndex * 5) + index;
              var hit;
              if (photoAll != null) {
                hit = photoAll.hits[hitIndex];
              }
              return GestureDetector(
                onTap: () {
                  if (photoAll != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WallpaperPage(
                          heroId: hit.id.toString(),
                          photoHits: hit,
                        ),
                      ),
                    );
                  }
                },
                child: CustomCard(
                  title: hit?.user,
                  url: hit?.webformatURL,
                ),
              );
            },
          );
        });
  }
}
