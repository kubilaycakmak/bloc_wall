import 'dart:ui';
import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:bloc_wall/ui/pages/list_photo.page.dart';
import 'package:bloc_wall/ui/pages/static_data/data_lists.dart';
import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
import 'package:bloc_wall/ui/pages/widget/parallax_card.dart';
import 'package:bloc_wall/ui/pages/widget/search_bar.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

import 'wallpaper_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();
  final _controller = TextEditingController();
  String globalSearchQuery = '';

  @override
  void dispose() {
    super.dispose();
    _photoBloc.close();
  }

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(() {
    //   if(_focusNode.hasFocus){
    //     _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
    //   }
    // });
    // _photoBloc.add(FetchPhoto(false, '', 'all', 'ass', 'latest', 'vertical'));
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

  // Widget _buildSearchBar(BuildContext context) {
  //   return Container(
  //     height: 125,
  //     alignment: Alignment.topCenter,
  //     decoration: BoxDecoration(boxShadow: <BoxShadow>[
  //       BoxShadow(
  //         color: Colors.black.withOpacity(0.1),
  //         blurRadius: 10,
  //         offset: Offset(0, 20),
  //       )
  //     ]),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       height: 125,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: <Widget>[
  //             Text("Let's search for the dream photo for your phone!", style: GoogleFonts.montserrat(
  //               fontSize: 18
  //             ),),
  //             SizedBox(height: 10,),
  //             Container(
  //               decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(35),
  //               border: Border.all()
  //               ),
  //                 child: buildSearchField(context),
  //             ),
  //           ],
  //         ),
  //       ),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.vertical(
  //           bottom: Radius.circular(35),
  //         ),
  //       )),
  //   );
  // }

  // Widget buildSearchField(BuildContext context) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       Container(
  //         alignment: Alignment.center,
  //         width: MediaQuery.of(context).size.width - 130,
  //         child: TextField(
  //           onSubmitted: (val){
  //             // _photoBloc.add(FetchPhoto(false, '$val', 'all', '$val', 'latest', 'vertical'));
  //             setState(() {
  //               globalSearchQuery = val;
  //             });
  //           },
  //           focusNode: _focusNode,
  //           controller: _controller,
  //           decoration: InputDecoration(
  //             hintText: 'Search Photos',
  //             hintStyle: TextStyle(
  //             ),
  //             border: InputBorder.none,
  //             prefixIcon: IconButton(icon: Icon(Icons.search, color: Colors.black54,), onPressed: (){},),
  //           ),
  //         )
  //       ),
  //       Container(
  //         decoration: BoxDecoration(
  //           border: Border(
  //             left: BorderSide(),
  //           )
  //         ),
  //         child: PopupMenuButton(
  //           offset: Offset(90,110),
  //           onSelected: (value){
  //             setState(() {
  //               // orientation = value;
  //             });
  //           },
  //           icon: Icon(Icons.filter_list, color: Colors.black54, size: 30,),
  //           itemBuilder: (BuildContext context) { 
  //             var list = List<PopupMenuEntry<Object>>();
  //             list.add(PopupMenuItem(
  //               height: 2,
  //               child: Text('Vertical'),
  //               value: 'vertical',
  //             ));
  //             list.add(
  //               PopupMenuDivider(
  //                 height: 10,
  //               ),
  //             );
  //             list.add(PopupMenuItem(
  //               height: 2,
  //               child: Text('Horizontal'),
  //               value: 'horizontal',
  //             ));
  //             return list;
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }

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
        if(state is PhotoIsNotLoaded){
          print('not loaded');
        }
        return Center(child: Text('error'));
      },
    );
  }

  // bool _handleScrollNotification(ScrollNotification notification){
  //   if(notification is ScrollEndNotification &&
  //   _scrollController.position.extentAfter == 0){
  //     print('object');
  //     // _photoBloc.fetchNextResultPage(widget.order, widget.orientation, widget.query, widget.category, widget.editorChoice, widget.imageType);
  //   }
  //   return false;
  // }
  //  Widget _buildGridViewList(PhotoAll photoAll) {
  //   return NotificationListener<ScrollNotification>(
  //     onNotification: _handleScrollNotification,
  //     child: StaggeredGridView.countBuilder(
  //       controller: _scrollController,
  //       shrinkWrap: true,
  //       crossAxisCount: 4,
  //       mainAxisSpacing: 1,
  //       itemCount: photoAll.hits.length,
  //       crossAxisSpacing: 1,
  //       staggeredTileBuilder: (index) =>
  //           StaggeredTile.count(2, index.isEven ? 2 : 3),
  //       itemBuilder: (context, index) {
  //         return Stack(
  //           children: <Widget>[
  //             GridTile(
  //               footer: Container(
  //                 height: 50,
  //               ),
  //               child: GestureDetector(
  //                 onTap: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => WallpaperPage(
  //                               heroId: photoAll.hits[index].id.toString(),
  //                               photoHits: photoAll.hits[index],
  //                             )));
  //                 },
  //                 child: FadeInImage(
  //                   image: NetworkImage(photoAll.hits[index].webformatURL),
  //                   fit: BoxFit.cover,
  //                   placeholder: NetworkImage(photoAll.hits[index].previewURL),
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               alignment: Alignment.bottomCenter,
  //               child: new ClipRect(
  //                 child: new BackdropFilter(
  //                   filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  //                   child: new Container(
  //                     height: 40.0,
  //                     decoration: new BoxDecoration(
  //                         color: Colors.grey.shade100.withOpacity(0.2)),
  //                     child: new Center(
  //                       child: new Text(photoAll.hits[index].user,
  //                           style: GoogleFonts.montserrat(color: Colors.white)),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         );
  //       }
  //     ),
  //   );
  // }

  Widget _buildListBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          _buildbuttonBar(photoOrVideoList),
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

  Widget _buildbuttonBar(List title) {
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
            onPressed: () {},
            child: Text(
              title[index],
              style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCarouselSlider(List<ParallaxCardItem> list, double height,
      double viewportFraction) {
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
