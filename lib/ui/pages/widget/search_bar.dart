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
  bool secondTile = false;

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
    return Container(
      height: 155,
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 15),
          )
        ]),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .translate('homepage-appbar-text'),
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).textTheme.bodyText1.color)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Center(
                            child: TextField(
                              onSubmitted: (val) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListPhotoPage(
                                              editorChoice: false,
                                              category: '',
                                              imageType: 'photo',
                                              order: '',
                                              orientation: 'vertical',
                                              query: val,
                                            )));
                              },
                              focusNode: _focusNode,
                              controller: _controller,
                              cursorColor:
                                  Theme.of(context).textTheme.bodyText1.color,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                hintText: AppLocalizations.of(context)
                                    .translate('homepage-searchbar-text'),
                                hintStyle: GoogleFonts.montserrat(),
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  icon: Icon(EvaIcons.search,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .color),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                          left: BorderSide(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                        )),
                        child: Container(
                          child: IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.filter_list,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
