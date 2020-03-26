import 'package:bloc_wall/ui/pages/animation/fade_animation.dart';
import 'package:bloc_wall/ui/pages/widget/search_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_localizations.dart';
import '../list_photo.page.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String orientation;
  bool filtered = false;
  double _dynamicHeight = 145;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _dynamicHeight,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 15,
          offset: Offset(0, 15),
        )
      ]),
      duration: Duration(milliseconds: 400),
      child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: _dynamicHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "LET'S FIND THE PERFECT PHOTO FOR YOU",
                  // AppLocalizations.of(context).translate('homepage-appbar-text'),
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).textTheme.bodyText1.color)),
                  child: Row(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width - 125,
                          child: TextField(
                            onSubmitted: (val) {
                              Navigator.push(context,MaterialPageRoute(
                                  builder: (context) => ListPhotoPage(
                                    editorChoice: false,
                                    category: '',
                                    imageType: 'all',
                                    order: '',
                                    orientation: 'vertical',
                                    query: val,
                                  )
                                )
                              );
                            },
                            focusNode: _focusNode,
                            controller: _controller,
                            cursorColor: Theme.of(context).textTheme.bodyText1.color,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              hintText: 'Search Photo',
                              // hintText: AppLocalizations.of(context)
                              //     .translate('homepage-searchbar-text'),
                              hintStyle: GoogleFonts.montserrat(

                              ),
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                icon: Icon(EvaIcons.search,
                                    color: Theme.of(context).textTheme.bodyText1.color),
                                onPressed: () {},
                              ),
                            ),
                          )),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            left:
                                BorderSide(color: Theme.of(context).textTheme.bodyText1.color),
                          )),
                          child: Container(
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  filtered ? filtered = false : filtered = true;
                                  filtered ? _dynamicHeight = 480 : _dynamicHeight = 145;
                                });
                              },
                              icon: Icon(Icons.filter_list, size: 30,),
                            ),
                          ),
                      )
                    ],
                  ),
                ),
                
                filtered?Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Divider(),
                    _filterMenu(),
                  ],
                ):Container(),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ), duration: Duration(milliseconds: 400),),
    );
  }

    Widget _filterMenu() {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  'Filter Menu',
                  style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                        fontSize: 17,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Direction',style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                        fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  spacing: 3,
                  children: <Widget>[
                    FilterChip(label: Text('Vertical'), onSelected: (bool value) { print('object'); },),
                    FilterChip(label: Text('Horizontal'), onSelected: (bool value) { print('object'); },),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Color',style: GoogleFonts.montserrat(
                      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
                        fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  spacing: 3,
                  children: <Widget>[
                    FilterChip(label: Text('grayscale'), onSelected: (bool value) { print('object'); }, backgroundColor: Colors.grey[400],),
                    FilterChip(label: Text('transparent'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.transparent),
                    FilterChip(label: Text('red'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.red),
                    FilterChip(label: Text('orange'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.orange),
                    FilterChip(label: Text('yellow'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.yellow),
                    FilterChip(label: Text('green'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.green),
                    FilterChip(label: Text('turquoise'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.blue[200]),
                    FilterChip(label: Text('blue'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.blue),
                    FilterChip(label: Text('lilac'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.purple[200]),
                    FilterChip(label: Text('pink'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.pink),
                    FilterChip(label: Text('white'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.white38),
                    FilterChip(label: Text('black'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.black54),
                    FilterChip(label: Text('brown'), onSelected: (bool value) { print('object'); },backgroundColor: Colors.brown),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
