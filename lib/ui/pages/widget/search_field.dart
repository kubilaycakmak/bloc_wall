import 'package:flutter/material.dart';
import '../../../app_localizations.dart';
import '../list_photo.page.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key key,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String orientation;

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 130,
            child: TextField(
              onSubmitted: (val) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListPhotoPage(
                              editorChoice: false,
                              category: '',
                              imageType: 'all',
                              order: '',
                              orientation: 'vertical',
                              query: val,
                            )));
              },
              focusNode: _focusNode,
              controller: _controller,
              cursorColor: Theme.of(context).textTheme.bodyText1.color,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Search Photo',
                // hintText: AppLocalizations.of(context)
                //     .translate('homepage-searchbar-text'),
                hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).textTheme.bodyText1.color),
                border: InputBorder.none,
                prefixIcon: IconButton(
                  icon: Icon(Icons.search,
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
          child: PopupMenuButton(
            offset: Offset(90, 110),
            onSelected: (value) {
              setState(() {
                orientation = value;
              });
            },
            icon: Icon(
              Icons.filter_list,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              var list = List<PopupMenuEntry<Object>>();
              list.add(PopupMenuItem(
                height: 2,
                child: Text(
                  AppLocalizations.of(context)
                      .translate('homepage_searchbar-filter-1'),
                ),
                value: 'vertical',
              ));
              list.add(
                PopupMenuDivider(
                  height: 10,
                ),
              );
              list.add(PopupMenuItem(
                height: 2,
                child: Text(
                  AppLocalizations.of(context)
                      .translate('homepage_searchbar-filter-2'),
                ),
                value: 'horizontal',
              ));
              return list;
            },
          ),
        )
      ],
    );
  }
}
