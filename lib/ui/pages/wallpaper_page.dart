import 'dart:ui';

import 'package:bloc_wall/data/model/photo/photo_hits.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class WallpaperPage extends StatefulWidget {
  final String heroId;
  final PhotoHits photoHits;

  const WallpaperPage({Key key, this.heroId, this.photoHits}) : super(key: key);
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  static const platform =
      const MethodChannel('com.kubilaycakmak.bloc_wall.bloc_wall/files');
  bool downloading = false;
  var progressString = "";
  String _setWallpaper = '';
  bool fullScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildPhoto(),
          _buildLoading(),
          _buildPositionedButtons(16, 16, 'close', EvaIcons.close),
          Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              !fullScreen ? Container(
                  padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: _buildBottomBar(context)) : Container()
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
                onTap: (){
                  setState(() {
                    print('object');
                    _dynamicHeight == 60 ? _dynamicHeight = 70 : _dynamicHeight = 60;
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
                            child: Text('by ${widget.photoHits.user}', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9)),),
                          ),
                          _dynamicHeight == 60 ? Container() : 
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            
                            children: <Widget>[
                              _buildBoardInfo(),
                              Column(
                                children: <Widget>[
                                  _buildSimiliarPhoto(),
                                  Container(child: FlatButton(onPressed: () { 
                                setState(() {
                                  _dynamicHeight = 80;
                                });
                               },
                              child: Text('see more', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9)),)),)
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
        _buildPositionedButtons(6, 25, 'set', Icons.format_paint),
        _buildPositionedButtons(56, 25, 'down', Icons.file_download),
        _buildPositionedButtons(106, 25, 'setting', EvaIcons.settingsOutline),
      ],
    );
  }

  Widget _buildSimiliarPhoto(){
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
          child: FadeInImage.memoryNetwork(
            image: widget.photoHits.largeImageURL,
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
          ),
        ),
      ),
    );
  }

  Container _buildLoading() {
    return Container(
      child: Align(
        alignment: Alignment(0.0, 0.0),
        child: Center(
          child: downloading
              ? Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.white60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 20.0),
                        Text(
                          "Downloading File : $progressString",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              : Text("")),
      ),
    );
  }

  Widget _buildBoardInfo() {
    return Container(
      height: _dynamicHeight,
      child: Table(
        border: TableBorder(
          verticalInside: BorderSide(
            color: Colors.white60
          )
        ),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white10
            ),
            children: [
              TableCell(child: Center(child: Text('Resolution : ${widget.photoHits.imageWidth} x ${widget.photoHits.imageHeight}', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9)),),),),
              TableCell(child: Center(child: Text('Size : ' + (widget.photoHits.imageSize/1000000).toString().substring(0,4) + ' mb', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9)))),),
            ]
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white24
            ),
            children: [
              TableCell(child: Center(child: Text('Views : ${widget.photoHits.views}', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9))),),),
              TableCell(child: Center(child: Text('Downloads : ${widget.photoHits.downloads}', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9))),),),
            ]
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.white10
            ),
            children: [
              TableCell(child: Center(child: Text('Favorites : ${widget.photoHits.favorites}', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9))),),),
              TableCell(child: Center(child: Text('Likes : ${widget.photoHits.likes}', style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.9))),),),
            ]
          )
        ],
      ),
    );
  }

  Positioned _buildPositionedButtons(
      double right, double top, String heroTag, IconData icon) {
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
          if (heroTag == 'set') {}
          if (heroTag == 'down') {}
          if (heroTag == 'settings') {}
        },
      ),
    );
  }

  Future<void> downloadImage() async {
    Dio dio = Dio();
    try {
      var directory = await getExternalStorageDirectory();
      print(directory);

      await dio.download(widget.photoHits.largeImageURL,
          "${directory.path}/${DateTime.now().toUtc().toIso8601String()}.jpg",
          onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
  }

  Future<Null> setWallpaper() async {
    Dio dio = Dio();
    try {
      var dir = await getTemporaryDirectory();
      print(dir);

      await dio
          .download(widget.photoHits.largeImageURL, "${dir.path}/myimage.jpeg",
              onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
          print(progressString);
          if (progressString == "100%") {
            _setWallpaer();
          }
        });
      });
    } catch (e) {}

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
  }

  Future<Null> _setWallpaer() async {
    String setWallpaper;
    try {
      final int result =
          await platform.invokeMethod('setWallpaper', 'myimage.jpeg');
      setWallpaper = 'Wallpaer Updated....';
    } on PlatformException catch (e) {
      setWallpaper = "Failed to Set Wallpaer: '${e.message}'.";
    }
    setState(() {
      _setWallpaper = setWallpaper;
    });
  }
}
