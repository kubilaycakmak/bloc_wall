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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.heroId,
            child: InkWell(
              onTap: (){

              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: FadeInImage(
                  image: NetworkImage(widget.photoHits.largeImageURL),
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/loading2.gif'),
                  height: 100,
                ),
              ),
            ),
          ),
         Container(
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
         ),
          Positioned(
            top: 48,
            left: 28,
            child: FloatingActionButton(
              heroTag: 'close',
              backgroundColor: Colors.white70,
              mini: true,
              child: Icon(EvaIcons.closeOutline, color: Colors.black, size: 30,),
              onPressed: (){
                Navigator.of(context).pop();
              },
              tooltip: 'Close'
            ),
          ),
          Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            height: 200.0,
                            decoration: new BoxDecoration(
                              color: Colors.grey.shade100.withOpacity(0.2)
                            ),
                            child: new Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10, bottom: 3),
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          child: Image.network(widget.photoHits.userImageURL),
                                          ),
                                          SizedBox(width: 5,),
                                        Text('@' + widget.photoHits.user, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20))
                                      ],
                                    ),
                                  ),
                                  Wrap(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text(widget.photoHits.tags),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text(widget.photoHits.imageWidth.toString() + ' x ' + widget.photoHits.imageHeight.toString()),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text('comments: ' + widget.photoHits.comments.toString()),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text(widget.photoHits.type),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text('views: ' + widget.photoHits.views.toString()),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text('likes: ' + widget.photoHits.likes.toString()),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text('downloads: ' + widget.photoHits.downloads.toString()),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 0, left: 10),
                                        child: Chip(
                                          elevation: 1,
                                          label: Text('favorites: ' + widget.photoHits.favorites.toString()),
                                        ),
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
                    Positioned(
                      right: 16.0,
                      top: 0.0,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white70,
                        heroTag: 'setWallpaper',
                        tooltip: 'Set as Wallpaper',
                        child: Icon(
                          Icons.format_paint,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          setWallpaper();
                        },
                      ),
                    ),
                    Positioned(
                      right: 86.0,
                      top: 0.0,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white70,
                        heroTag: 'downloadWallpaper',
                        tooltip: 'Set as Wallpaper',
                        child: Icon(
                          Icons.file_download,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          downloadImage();
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
        ],
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

      await dio.download(widget.photoHits.largeImageURL, "${dir.path}/myimage.jpeg",
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