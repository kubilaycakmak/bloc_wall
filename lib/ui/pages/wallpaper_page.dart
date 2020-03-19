import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:bloc_wall/data/model/photo/photo_hits.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';

class WallpaperPage extends StatefulWidget {
  final String heroId;
  final PhotoHits photoHits;

  const WallpaperPage({Key key, this.heroId, this.photoHits}) : super(key: key);
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  static const platform =
      const MethodChannel('com.kubilaycakmak.bloc_wall.bloc_wall/wallpaper');
  bool fullScreen = false;
  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildPhoto(),
          _buildPositionedButtons(
              16, 16, 'close', EvaIcons.close, widget.photoHits.largeImageURL),
          Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              !fullScreen
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: _buildBottomBar(context))
                  : Container()
            ],
          )
        ],
      ),
    );
  }

  double _dynamicHeight = 60;
  Widget _buildBottomBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print('object');
                    _dynamicHeight == 60
                        ? _dynamicHeight = 70
                        : _dynamicHeight = 60;
                  });
                },
                child: FittedBox(
                  child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(0.2)),
                    child: new Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          AnimatedContainer(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            alignment: Alignment.topLeft,
                            height: _dynamicHeight,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              'by ${widget.photoHits.user}',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                          ),
                          _dynamicHeight == 60
                              ? Container()
                              : Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    _buildBoardInfo(),
                                    Column(
                                      children: <Widget>[
                                        _buildSimiliarPhoto(),
                                        Container(
                                          child: FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  _dynamicHeight = 80;
                                                });
                                              },
                                              child: Text(
                                                'see more',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.white
                                                        .withOpacity(0.9)),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        _buildPositionedButtons(
            6, 25, 'set', Icons.format_paint, widget.photoHits.largeImageURL),
        _buildPositionedButtons(56, 25, 'down', Icons.file_download,
            widget.photoHits.largeImageURL),
        _buildPositionedButtons(106, 25, 'setting', EvaIcons.settingsOutline,
            widget.photoHits.largeImageURL),
      ],
    );
  }

  Widget _buildSimiliarPhoto() {
    return Container(
      child: Image(
        image: NetworkImage(widget.photoHits.previewURL),
      ),
    );
  }

  Hero _buildPhoto() {
    return Hero(
      tag: widget.heroId,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (fullScreen == false) {
              fullScreen = true;
            } else {
              fullScreen = false;
            }
          });
        },
        onVerticalDragEnd: (val) {
          if (val.primaryVelocity != 0) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              fadeInCurve: Curves.slowMiddle,
              imageUrl: widget.photoHits.largeImageURL,
              placeholder: (context, url) => CachedNetworkImage(
                imageUrl: widget.photoHits.webformatURL,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }

  Widget _buildBoardInfo() {
    return Container(
      height: _dynamicHeight,
      child: Table(
        border: TableBorder(verticalInside: BorderSide(color: Colors.white60)),
        children: [
          TableRow(decoration: BoxDecoration(color: Colors.white10), children: [
            TableCell(
              child: Center(
                child: Text(
                  'Resolution : ${widget.photoHits.imageWidth} x ${widget.photoHits.imageHeight}',
                  style: GoogleFonts.montserrat(
                      color: Colors.white.withOpacity(0.9)),
                ),
              ),
            ),
            TableCell(
              child: Center(
                  child: Text(
                      'Size : ' +
                          (widget.photoHits.imageSize / 1000000)
                              .toString()
                              .substring(0, 4) +
                          ' mb',
                      style: GoogleFonts.montserrat(
                          color: Colors.white.withOpacity(0.9)))),
            ),
          ]),
          TableRow(decoration: BoxDecoration(color: Colors.white24), children: [
            TableCell(
              child: Center(
                child: Text('Views : ${widget.photoHits.views}',
                    style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.9))),
              ),
            ),
            TableCell(
              child: Center(
                child: Text('Downloads : ${widget.photoHits.downloads}',
                    style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.9))),
              ),
            ),
          ]),
          TableRow(decoration: BoxDecoration(color: Colors.white10), children: [
            TableCell(
              child: Center(
                child: Text('Favorites : ${widget.photoHits.favorites}',
                    style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.9))),
              ),
            ),
            TableCell(
              child: Center(
                child: Text('Likes : ${widget.photoHits.likes}',
                    style: GoogleFonts.montserrat(
                        color: Colors.white.withOpacity(0.9))),
              ),
            ),
          ])
        ],
      ),
    );
  }

  Positioned _buildPositionedButtons(
      double right, double top, String heroTag, IconData icon, String url) {
    return Positioned(
      right: right,
      top: top,
      child: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.grey.shade100.withOpacity(0.6),
        heroTag: heroTag,
        tooltip: heroTag,
        child: Icon(
          icon,
          color: Colors.black87,
        ),
        onPressed: () {
          if (heroTag == 'close') {
            Navigator.of(context).pop();
          }
          if (heroTag == 'set') {
            setWallpaperDialog();
          }
          if (heroTag == 'down') {}
          if (heroTag == 'settings') {}
        },
      ),
    );
  }

  void setWallpaperDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.grey.shade100.withOpacity(0.1),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              child: Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Set as wallpaper',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Home Screen',
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: Icon(
                        EvaIcons.home,
                        color: Colors.black,
                      ),
                      onTap: () => _setWallpaper(1),
                    ),
                    ListTile(
                      title: Text(
                        'Lock Screen',
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: Icon(
                        EvaIcons.lock,
                        color: Colors.black,
                      ),
                      onTap: () => _setWallpaper(2),
                    ),
                    ListTile(
                      title: Text(
                        'Both',
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: Icon(
                        EvaIcons.image2,
                        color: Colors.black,
                      ),
                      onTap: () => _setWallpaper(3),
                    ),
                    ListTile(
                      title: Text(
                        'Close',
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: Icon(
                        EvaIcons.close,
                        color: Colors.black,
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _setWallpaper(int wallpaperType) async {
    var file = await DefaultCacheManager()
        .getSingleFile(widget.photoHits.largeImageURL);
    try {
      final int result = await platform
          .invokeMethod('setWallpaper', [file.path, wallpaperType]);
      print('Wallpaer Updated.... $result');
    } on PlatformException catch (e) {
      print("Failed to Set Wallpaer: '${e.message}'.");
    }
    Fluttertoast.showToast(
        msg: "Wallpaper set successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
    Navigator.pop(context);
  }
}
