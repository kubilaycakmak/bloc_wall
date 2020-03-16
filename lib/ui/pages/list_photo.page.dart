import 'dart:ui';

import 'package:bloc_wall/data/model/photo/photo_all.dart';
import 'package:bloc_wall/data/repository/photo_repository.dart';
import 'package:bloc_wall/ui/pages/wallpaper_page.dart';
import 'package:bloc_wall/ui/pages/widget/centered_message.dart';
import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
import 'package:bloc_wall/ui/photo/photo_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class ListPhotoPage extends StatefulWidget {
  final String imageType;
  final String query;
  final String order;
  final String orientation;
  final String category;

  const ListPhotoPage(
      {Key key,
      this.imageType,
      this.query,
      this.order,
      this.orientation,
      this.category})
      : super(key: key);

  @override
  _ListPhotoPageState createState() => _ListPhotoPageState();
}

class _ListPhotoPageState extends State<ListPhotoPage> {
  final _photoBloc = kiwi.Container().resolve<PhotoBloc>();

  @override
  void initState() {
    super.initState();
    print(widget.imageType);
    print(widget.query);
    print(widget.order);
    print(widget.orientation);
    _photoBloc.add(FetchPhoto(
        widget.imageType, widget.query, widget.order, widget.orientation));
  }

  @override
  void dispose() {
    super.dispose();
    _photoBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = (MediaQuery.of(context).size.width +
            MediaQuery.of(context).size.height) /
        40;
    return BlocProvider(
      create: (context) => PhotoBloc(PhotoRepository()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            widget.order.toUpperCase(),
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 20),
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              EvaIcons.arrowBackOutline,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildBlocBuilder(),
            CustomNavbar(
              iconSize: iconSize,
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
          return _buildGridViewList(state.getPhoto);
        }
        return Text('error');
      },
    );
  }

  Widget _buildGridViewList(PhotoAll photoAll) {
    return StaggeredGridView.countBuilder(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 1,
        itemCount: 50,
        crossAxisSpacing: 1,
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 3),
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              GridTile(
                footer: Container(
                  height: 50,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WallpaperPage(
                                  heroId: photoAll.hits[index].id.toString(),
                                  photoHits: photoAll.hits[index],
                                )));
                  },
                  child: Image.network(
                    photoAll.hits[index].webformatURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: new ClipRect(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: new Container(
                      height: 40.0,
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade100.withOpacity(0.2)),
                      child: new Center(
                        child: new Text(photoAll.hits[index].user,
                            style: GoogleFonts.montserrat(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
