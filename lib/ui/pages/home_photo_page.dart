import 'package:bloc_wall/data/repository/api_repository.dart';
import 'package:bloc_wall/ui/pages/list_photo.page.dart';
import 'package:bloc_wall/ui/pages/static_data/data_lists.dart';
import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:bloc_wall/ui/pages/widget/search_bar.dart';
import 'package:bloc_wall/ui/pages/widget/slide_card.dart';
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
  bool filtered = true;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.90);
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
            FadeAnimation(0.9, VerticalDivider(
              indent: 100,
              endIndent: 0,
              color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
              width: 50,
              thickness: 4,
            )),
            FadeAnimation(0.3, _buildBlocBuilder()),
            FadeAnimation(0.5, SafeArea(child: SearchBar())),
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
      padding: const EdgeInsets.only(top: 150.0),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          filtered ? _filterMenu() : Container(),
          Padding(
            padding: EdgeInsets.only(left: 25, bottom: 10),
            child: Text(
              ' # Daily Hots',
              style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                      fontSize: 17, fontWeight: FontWeight.bold,),
            ),
          ),
          SlidingCardsView(
            list: bannerA,
            fontSize: 50,
            height: 150,
            viewportFraction: 0.89,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  ' # Categories',
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                      fontSize: 17, fontWeight: FontWeight.bold,),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View All >',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          SlidingCardsView(
            list: bannerCategories,
            fontSize: 30,
            height: 100,
            viewportFraction: 0.89,
          ),
          // Container(
          //   height: 140,
          //   child: PageView.builder(
          //     controller: pageController,
          //     allowImplicitScrolling: true,
          //     itemCount: bannerCategories1.length,
          //     itemBuilder: (context, index){
          //       return ParallaxCards(
          //         item: bannerCategories1[index],
          //         pageVisibility: PageVisibility(pagePosition: 0, visibleFraction: 0.8),
          //       );
          //     },
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  ' # By Colors',
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                      fontSize: 17, fontWeight: FontWeight.bold,),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View All >',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          _buildCarouselSliderbyColor(byColor, 80, 0.36),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              ' # Explore Others',
              style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                      fontSize: 17, fontWeight: FontWeight.bold,),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _buildBanner(bannerVector, 150),
          _buildBanner(bannerIllistration, 150),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _filterMenu() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                ' # Filter Menu',
                style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                      fontSize: 17, fontWeight: FontWeight.bold,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text('Direction:',style: GoogleFonts.montserrat(
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                      fontSize: 17, fontWeight: FontWeight.bold,),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Wrap(
                children: <Widget>[
                  Chip(label: Text('Vertical')),
                  Chip(label: Text('Horizontal')),
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildCarouselSlider(
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
            child: ParallaxCards(
              item: item,
              pageVisibility:
                  PageVisibility(pagePosition: 0, visibleFraction: 0.8),
            ),
          );
        },
      ),
    );
  }
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
