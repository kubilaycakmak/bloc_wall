import 'package:bloc_wall/ui/pages/widget/search_field.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      overflow: Overflow.clip,
      textDirection: TextDirection.ltr,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text('LETS FIND OUT THE PHOTO WHICH YOU LIKE'),
          ),
          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all()
            ),
              child: SearchWidget(),
          ),
        ],
    );
  }
}