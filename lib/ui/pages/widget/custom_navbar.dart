import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomNavbar extends StatefulWidget {

  final double iconSize;

  const CustomNavbar({Key key, this.iconSize}) : super(key: key);

  @override
  _CustomNavbarState createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _selected = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 5.2,
            width: MediaQuery.of(context).size.width / 1.2,
            padding: EdgeInsets.only(bottom: 20.0),
            child: FloatingActionButton.extended(
              elevation: 15,
              backgroundColor: Colors.white,
              onPressed: null,
              label: ButtonBar(
                children: <Widget>[
                  _buildCircleAvatar(EvaIcons.home, EvaIcons.homeOutline, widget.iconSize, 0),
                  SizedBox(
                    width: 30,
                  ),
                  _buildCircleAvatar(EvaIcons.heart, EvaIcons.heartOutline, widget.iconSize, 2),
                  SizedBox(
                    width: 30,
                  ),
                  _buildCircleAvatar(EvaIcons.settings, EvaIcons.settingsOutline, widget.iconSize, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(IconData iconSelected, IconData iconUnselected, double iconSize, int id) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: FlatButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onPressed: () {
          setState(() {
            _selected = id;
          });
        },
        child: Icon(_selected == id ? iconSelected : iconUnselected, size: iconSize, color: _selected == id ? Colors.black : Colors.black54,),
      ),
    );
  }
}