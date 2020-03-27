import 'package:bloc_wall/data/repository/api_repository.dart';
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
                SafeArea(
                  child: SearchBar(),
                )),
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
          print('notlist');
          return _buildListBody();
        }
        if (state is PhotoIsLoading) {
          print('loading');
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PhotoIsLoaded) {
          return Text('heyyo');
        }
        if (state is PhotoIsNotLoaded) {
          print('not loaded');
        }
        return Center(child: Text('error'));
      },
    );
  }

  Widget _buildListBody() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.only(top: 150),
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              '- Daily Hots',
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
                  '- Categories',
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
                    'View All > ',
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
                  onPressed: () {},
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
                  '- Colors',
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
                    'View All > ',
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
                  onPressed: () {},
                ),
              ],
            ),
          ),
          _buildCarouselSlider(byColor, 100, .4, 7),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget _buildCarouselSliderbyColor(
      List<ParallaxCardItem> list, double height, double viewportFraction) {
    return Container(
      height: height,
      child: CarouselSlider.builder(
        initialPage: 0,
        viewportFraction: viewportFraction,
        autoPlay: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListPhotoPage(
                            editorChoice: list[index].editCho,
                            category: list[index].title,
                            imageType: 'photo',
                            order: list[index].body,
                            orientation: 'vertical',
                            query: '',
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 2), blurRadius: 4, color: item.colors)
                  ],
                  border: Border.all(width: 0.1),
                  borderRadius: BorderRadius.circular(10),
                  color: item.colors,
                ),
                child: Center(
                  child: Text(
                    item.title,
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                ),
              ),
            ),
          );
        },
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
            aspectRatio: 2,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            onPageChanged: (val) {
              setState(() {
                // _current = val;
              });
            },
            itemBuilder: (context, index) {
              final item = list[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListPhotoPage(
                                editorChoice: list[index].editCho,
                                category: list[index].title,
                                imageType: 'photo',
                                order: list[index].body,
                                orientation: 'vertical',
                                query: '',
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: map<Widget>(list, (index, url) {
          //     return Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Container(
          //         width: 8.0,
          //         height: 10,
          //         margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.5),
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: _current == index ? Theme.of(context).primaryColor.withOpacity(0.4) : Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5)
          //         ),
          //       ),
          //     );
          //   }),
          // ),
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
      padding: EdgeInsets.only(left: 24),
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
