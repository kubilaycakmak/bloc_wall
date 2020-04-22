import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:bloc_wall/ui/pages/view_all.dart';
import 'package:bloc_wall/ui/pages/list_photo.page.dart';
import 'package:bloc_wall/ui/pages/static_data/data_lists.dart';
import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:bloc_wall/ui/pages/widget/search_bar.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import '../../app_localizations.dart';
import 'animation/fade_animation.dart';

class HomePhotoPage extends StatefulWidget {
  @override
  _HomePhotoPageState createState() => _HomePhotoPageState();
}

class _HomePhotoPageState extends State<HomePhotoPage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();
  String globalSearchQuery = '';
  PageController pageController;
  // int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _photoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(ApiRepository()),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            FadeAnimation(0.3, _buildBlocBuilder()),
            FadeAnimation(
              0.5,
              SearchBar(),
            )
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
          return _buildListBody();
        }
        if (state is PhotoIsLoading) {
          print('PhotoIsLoading');
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PhotoIsLoaded) {
          return Text('PhotoIsLoaded');
        }
        if (state is PhotoIsNotLoaded) {
          print('PhotoIsNotLoaded');
        }
        return Center(child: Text('error'));
      },
    );
  }

  Widget _buildListBody() {
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: ListView(
        padding: EdgeInsets.only(top: 165),
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              AppLocalizations.of(context)
                  .translate('homepage-category-title1'),
              style: GoogleFonts.montserrat(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.5),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          _buildCarouselSlider(bannerA, 400, .85, 0),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .translate('homepage-category-title2'),
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                FlatButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('homepage-category-viewAll'),
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAll(
                            list: bannerCategories1,
                            title: 'By Categories',
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
          _buildCarouselSlider(bannerCategories1, 150, .45, 3),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .translate('homepage-category-title3'),
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .color
                        .withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                FlatButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('homepage-category-viewAll'),
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewAll(
                            list: byColor,
                            title: 'By Colors',
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
          _buildCarouselSlider(byColor, 100, .4, 7),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20, top: 20),
            child: Text(
              AppLocalizations.of(context)
                  .translate('homepage-category-title4'),
              style: GoogleFonts.montserrat(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.5),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          _buildBanner(bannerVector, 150),
          SizedBox(
            height: 20,
          ),
          _buildBanner(bannerIllistration, 150),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider(List<ParallaxCardItem> list, double height,
      double viewportFraction, int initPage) {
    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          CarouselSlider.builder(
            height: height,
            initialPage: initPage,
            enlargeCenterPage: true,
            viewportFraction: viewportFraction,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            onPageChanged: (val) {},
            itemBuilder: (context, index) {
              final item = list[index];
              return GestureDetector(
                onTap: () {
                  print('Card a basildi.');
                  print(list[index]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPhotoPage(
                                color: list[index].color,
                                order: list[index].content,
                                category: list[index].categories,
                                editorChoice: list[index].editCho,
                                imageType: 'photo',
                                orientation: 'vertical',
                                query: '',
                                page: 0,
                                title: list[index].title,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.03)),
                  child: ParallaxCards(
                    item: item,
                    pageVisibility: PageVisibility(
                        pagePosition: 0, visibleFraction: viewportFraction),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

Widget _buildBanner(List<ParallaxCardItem> list, double height) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: height,
      child: PageTransformer(pageViewBuilder: (context, visibilityResolver) {
        return PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: (value) {},
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPhotoPage(
                                editorChoice: list[index].editCho,
                                imageType: list[index].imageType,
                                order: 'latest',
                                category: '',
                                orientation: 'vertical',
                                query: '',
                              )));
                },
                child: ParallaxCards(
                  item: item,
                  pageVisibility: pageVisibility,
                ),
              );
            });
      }));
}
