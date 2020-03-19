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

class HomePhotoPage extends StatefulWidget {
  @override
  _HomePhotoPageState createState() => _HomePhotoPageState();
}

class _HomePhotoPageState extends State<HomePhotoPage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();
  String globalSearchQuery = '';

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
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildBlocBuilder(),
            SafeArea(
                child: SearchBar(
              title: 'photo',
            )),
            // CustomNavbar(
            //   iconSize: iconSize,
            // ),
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
          _buildCarouselSlider(bannerA, 200, 0.90),
          Text(
            '\t\t\t\t\t\tCategories',
            style: GoogleFonts.montserrat(
              fontSize: 15,
            ),
          ),
          // _buildParallaxCardSlider(bannerCategories),
          _buildCarouselSlider(bannerCategories, 200, 0.45),
          _buildBanner(bannerVector, 250),
          _buildBanner(bannerIllistration, 250),
          SizedBox(
            height: 50,
          )
        ],
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
