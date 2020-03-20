import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  const CustomAppBar({Key key, this.title}) : super(key: key);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      elevation: 0,
    );
  }
}
