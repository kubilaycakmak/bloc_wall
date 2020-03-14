import 'package:bloc_wall/ui/pages/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
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
        height: 135,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Let's search the dream photo for you phone!", style: GoogleFonts.montserrat(
                fontSize: 22
              ),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all()
                ),
                  child: SearchWidget(),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          ),
        )),
    );
  }
}