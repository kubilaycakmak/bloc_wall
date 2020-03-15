import 'dart:ui';
import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:bloc_wall/ui/pages/list_photo.page.dart';
import 'package:bloc_wall/ui/pages/static_data/data_lists.dart';
import 'package:bloc_wall/ui/pages/widget/centered_message.dart';
import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:bloc_wall/ui/pages/widget/search_bar.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();

  @override
  void dispose() {
    super.dispose();
    _photoBloc.close();
  }
  @override
  void initState() {
    super.initState();
    _photoBloc.add(FetchPhoto('photo', '', 'latest', 'vertical'));
  }

  @override
  Widget build(BuildContext context) {
    
    final double iconSize = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        40;
    return BlocProvider(
      create: (context) => PhotoBloc(PhotoRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildBlocBuilder(),
            SafeArea(child: SearchBar()),
            CustomNavbar(
              iconSize: iconSize,
            ),
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
          return CenteredMessage(
            message: 'Error while fetching photos',
            icon: EvaIcons.doneAll,
          );
        }
        if (state is PhotoIsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PhotoIsLoaded) {
          return _buildListBody(state.getPhoto);
        }
        return Text('error');
      },
    );
  }

  ListView _listPhotoView(PhotoIsLoaded state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          child: Image.network(
            state.getPhoto.hits[index].previewURL,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  Widget _buildListBody(PhotoAll photoAll) {

    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          _buildbuttonBar(photoOrVideoList),
          _buildCarouselSlider(bannerA, 200, photoAll),
          Text('\t\t\t\t\t\tCategories', style: GoogleFonts.montserrat(fontSize: 15,),),
          _buildParallaxCardSlider(bannerCategories),
          _buildBanner(bannerPhoto, 250),
          _buildBanner(bannerVector, 250),
          _buildBanner(bannerIllistration, 250),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

  Padding _buildParallaxCardSlider(List<ParallaxCardItem> bannerA) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(70.0),
        child: PageTransformer(
          pageViewBuilder: (context, visibilityResolver) {
            return PageView.builder(
              controller: PageController(viewportFraction: 0.55),
              itemCount: bannerA.length,
              itemBuilder: (context, index) {
                final item = bannerA[index];
                final pageVisibility =
                    visibilityResolver.resolvePageVisibility(index);
                return ParallaxCards(
                  item: item,
                  pageVisibility: pageVisibility,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildbuttonBar(List title) {
    int _selected = 0;
    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: title.length,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return FlatButton(
            splashColor: Colors.grey.shade100,
            highlightColor: Colors.transparent,
            onPressed: () {
            },
            child: Text(
              title[index],
              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarouselSlider(
      List<ParallaxCardItem> list, double height, PhotoAll photoAll) {
    return Container(
      height: 200,
      child: CarouselSlider.builder(
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
                        category: '',
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
        height: 400.0,
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
                onTap: () {},
                child: ParallaxCards(
                  item: item,
                  pageVisibility: pageVisibility,
                ),
              );
            });
      }));
}
