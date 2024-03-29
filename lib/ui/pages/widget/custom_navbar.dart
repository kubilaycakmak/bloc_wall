import 'package:bloc_wall/ui/pages/animation/fade_animation.dart';
import 'package:bloc_wall/ui/pages/favorite_page.dart';
import 'package:bloc_wall/ui/pages/home_photo_page.dart';
import 'package:bloc_wall/ui/pages/settings_page.dart';
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
  List pages = [HomePhotoPage(), FavoritePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          pages[_selected],
          Container(
            alignment: Alignment.bottomCenter,
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                FadeAnimation(
                    1.3,
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: FloatingActionButton.extended(
                        elevation: 15,
                        backgroundColor: Theme.of(context).primaryColor,
                        onPressed: null,
                        label: ButtonBar(
                          alignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _buildCircleAvatar(
                                EvaIcons.image2, EvaIcons.imageOutline, 25, 0),
                            SizedBox(
                              width: 30,
                            ),
                            _buildCircleAvatar(
                                Icons.blur_circular, Icons.blur_on, 30, 1),
                            SizedBox(
                              width: 30,
                            ),
                            _buildCircleAvatar(EvaIcons.colorPalette,
                                EvaIcons.colorPaletteOutline, 25, 2),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar _buildCircleAvatar(
      IconData iconSelected, IconData iconUnselected, double iconSize, int id) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: FlatButton(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onPressed: () {
          setState(() {
            _selected = id;
            print(_selected);
          });
        },
        child: Icon(_selected == id ? iconSelected : iconUnselected,
            size: iconSize, color: Theme.of(context).textTheme.bodyText1.color),
      ),
    );
  }
}
