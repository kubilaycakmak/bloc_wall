import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    @required this.url,
    @required this.title,
  });
  final String url;
  final String title;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Stack(
        children: <Widget>[
          Container(
            child: (widget.url != null)
                ? CachedNetworkImage(
                    imageUrl: widget.url,
                    fit: BoxFit.cover,
                  )
                : null,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: new ClipRect(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: new Container(
                      height: 40.0,
                      decoration: new BoxDecoration(
                          color: Colors.grey.shade100.withOpacity(0.2)),
                      child: new Center(
                        child: new Text(
                            (widget.title != null) ? widget.title : '',
                            style: GoogleFonts.montserrat(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  BoxDecoration _whiteGradientDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.black, const Color(0x10000000)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter),
    );
  }
}
