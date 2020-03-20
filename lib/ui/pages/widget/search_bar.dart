import 'package:bloc_wall/ui/pages/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  final String title;
  const SearchBar({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(0, 20),
        )
      ]),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 125,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Let's search for the dream $title for your phone!",
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                          color: Theme.of(context).textTheme.bodyText1.color)),
                  child: SearchWidget(title: '$title'),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          )),
    );
  }
}
