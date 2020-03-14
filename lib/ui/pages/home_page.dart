import 'dart:ui';

import 'package:bloc_wall/data/model/photo_all.dart';
import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:bloc_wall/ui/pages/wallpaper_page.dart';
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
  AssetImage latest = AssetImage('assets/latest.jpg');
  AssetImage popular = AssetImage('assets/popular.jpg');
  AssetImage random = AssetImage('assets/random.jpg');

  @override
  void dispose() {
    super.dispose();
    _photoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = (MediaQuery.of(context).size.width + MediaQuery.of(context).size.height) / 40;
    return BlocProvider(
      create: (context) => PhotoBloc(PhotoRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildBlocBuilder(),
             SafeArea(
               child: SearchBar()),
            CustomNavbar(iconSize: iconSize,),
          ],
        ),
      ),
    );
  }

  BlocBuilder<PhotoBloc, PhotoState> _buildBlocBuilder() {
    _photoBloc.add(FetchPhoto('', 'latest', 'vertical'));
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

  Widget _buildListBody(PhotoAll photoAll){

    final bannerA = <ParallaxCardItem>[
      ParallaxCardItem(
        title: 'Explore the latest photo album',
        body: 'latest',
        imagePath: photoAll.hits[0].webformatURL,
      ),
      ParallaxCardItem(
        title: 'See what people likes',
        body: 'popular',
        imagePath: photoAll.hits[1].webformatURL,
      ),
      ParallaxCardItem(
        title: 'Randomly',
        body: 'random',
        imagePath: photoAll.hits[2].webformatURL,
      ),
    ];

    final bannerB = <ParallaxCardItem>[
      ParallaxCardItem(
        title: 'Tap to Explore',
        body: 'Photo of the day',
        imagePath: photoAll.hits[3].webformatURL,
      ),
    ];

    final bannerC = <ParallaxCardItem>[
      ParallaxCardItem(
        title: 'Tap to Explore',
        body: 'Editor Choice',
        imagePath: photoAll.hits[4].webformatURL,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          _buildCarouselSlider(bannerA, 200, photoAll),
          Text("\t\tToday's Fav! ", style: GoogleFonts.montserrat(
            fontSize: 20
          ),),
          _buildBanner(bannerB, 300),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(EvaIcons.arrowDownOutline),
                  FlatButton(
                    onPressed: (){},
                    child: Text('Editor Choice', style: GoogleFonts.montserrat(color: Colors.black),),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(EvaIcons.arrowDownOutline),
                  FlatButton(
                    onPressed: (){},
                    child: Text('Developer Choice', style: GoogleFonts.montserrat(color: Colors.black),),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(EvaIcons.arrowDownOutline),
                  FlatButton(
                    onPressed: (){},
                    child: Text('Your Chance', style: GoogleFonts.montserrat(color: Colors.black),),
                  ),
                ],
              ),
            ],
          ),
          _buildBanner(bannerC, 250)
        ],
      ),
    );
  }

  Widget _buildCarouselSlider(List<ParallaxCardItem> list, double height, PhotoAll photoAll) {
    return CarouselSlider.builder(
      scrollDirection: Axis.horizontal,
      aspectRatio: 16 / 9,
      itemCount: list.length,
      itemBuilder: (context, index){
        final item = list[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => WallpaperPage(
                heroId: '$index',
                imageUrl: photoAll.hits[index].largeImageURL,
              )
            ));
          },
          child: ParallaxCards(
            item: item,
            pageVisibility: PageVisibility(pagePosition: 0, visibleFraction: 0.8 ),
          ),
        );
      },
      height: 400.0,
    );
  }
}

  Widget _buildBanner(List<ParallaxCardItem> list, double height) {
    return Container(
      height: height,
      child: PageTransformer(
        pageViewBuilder: (context, visibilityResolver){
          return  PageView.builder(
            physics: BouncingScrollPhysics(),
            onPageChanged: (value) {},
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              final item = list[index];
              final pageVisibility =
                              visibilityResolver.resolvePageVisibility(index);
              return GestureDetector(
                onTap: (){
                },
                child: ParallaxCards(
                  item: item,
                  pageVisibility: pageVisibility,
                ),
              );
            }
          );
        }
      )
    );
  }