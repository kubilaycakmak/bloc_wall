import 'package:flutter/material.dart';

class WallpaperPage extends StatefulWidget {
  final String heroId, imageUrl;

  const WallpaperPage({Key key, this.heroId, this.imageUrl}) : super(key: key);
  @override
  _WallpaperPageState createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  bool downloading = false;
  var progressString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.heroId,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: FadeInImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/loading2.gif'),
                height: 100,
              ),
            ),
          ),
          Positioned(
            top: 28,
            left: 8,
            child: FloatingActionButton(
              onPressed: (){},
              tooltip: 'Close'
            ),
          )
        ],
      ),
    );
  }
}