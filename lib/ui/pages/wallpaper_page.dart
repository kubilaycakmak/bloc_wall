import 'dart:ui';

import 'package:bloc_wall/data/model/photo/photo_hits.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
              fullScreen == false
                  ? AnimatedContainer(
                      padding: EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      duration: Duration(seconds: 5),
                      child: _buildBottomBar(context))
                  : Container()
            ],
          )
        ],
      ),
    );
  }

  Stack _buildBottomBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: FittedBox(
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.2)),
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, bottom: 3),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.black12,
                                child: widget.photoHits.userImageURL != ''
                                    ? Image.network(
                                        widget.photoHits.userImageURL)
                                    : Icon(EvaIcons.person),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('@' + widget.photoHits.user,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 18))
                            ],
                          ),
                        ),
                        Wrap(
                          children: <Widget>[
                            _buildPaddingClips(
                                '', widget.photoHits.tags.toString()),
                            _buildPaddingClips('Resolution: ',
                                '${widget.photoHits.imageWidth.toString()} x ${widget.photoHits.imageHeight.toString()}'),
                            _buildPaddingClips('Comments: ',
                                widget.photoHits.comments.toString()),
                            _buildPaddingClips(
                                'Type: ', widget.photoHits.type.toString()),
                            _buildPaddingClips(
                                'Views: ', widget.photoHits.views.toString()),
                            _buildPaddingClips(
                                'Likes: ', widget.photoHits.likes.toString()),
                            _buildPaddingClips('Downsloads: ',
                                widget.photoHits.downloads.toString()),
                            _buildPaddingClips('Favorites: ',
                                widget.photoHits.favorites.toString()),
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
        _buildPositionedButtons(16, 0, 'set', Icons.format_paint),
        _buildPositionedButtons(66, 0, 'down', Icons.file_download),
        _buildPositionedButtons(116, 0, 'setting', EvaIcons.settingsOutline)
      ],
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
            print(fullScreen);
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
          child: FadeInImage(
            image: NetworkImage(widget.photoHits.largeImageURL),
            fit: BoxFit.cover,
            placeholder: NetworkImage(widget.photoHits.webformatURL),
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

  Padding _buildPaddingClips(String title, String label) {
    return Padding(
      padding: EdgeInsets.only(top: 0, left: 5),
      child: Chip(
        elevation: 1,
        label: Text(
          title + label,
          style: GoogleFonts.montserrat(fontSize: 13),
        ),
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
        backgroundColor: Colors.white70,
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
