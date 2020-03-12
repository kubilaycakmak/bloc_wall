
import 'package:flutter/material.dart';

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
      if(_focusNode.hasFocus){
        _controller.selection = TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 250,
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              hintText: '\tSearch Photos',
              hintStyle: TextStyle(
              ),
              border: InputBorder.none,
              icon: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30, bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.black54,),
                      SizedBox(width: 5,),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                        width: 1,
                      )
                    ],
                  ),
                ),
              ),
              
              // suffixIcon: PopupMenuButton(
              //   onSelected: (value){
              //     setState(() {
              //       orientation = value;
              //     });
              //   },
              //   icon: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: <Widget>[
              //          VerticalDivider(
              //           color: Colors.black,
              //           thickness: 1,
              //           width: 0,
              //         ),
              //          SizedBox(width: 5,),
              //          Column(
              //            children: <Widget>[
              //              Text('filter by', style: TextStyle(fontSize: 7),),
              //              Icon(Icons.filter_list, color: Colors.black54,),
              //            ],
              //          ),
              //       ],
              //     ),
              //   itemBuilder: (BuildContext context) { 
              //     var list = List<PopupMenuEntry<Object>>();
              //     list.add(PopupMenuItem(
              //       child: Text('Vertical'),
              //       value: 'vertical',
              //     ));
              //     list.add(
              //       PopupMenuDivider(
              //         height: 10,
              //       ),
              //     );
              //     list.add(PopupMenuItem(
              //       child: Text('Horizontal'),
              //       value: 'horizontal',
              //     ));
              //     return list;
              //   },
              // )
            ),
            
          )
          
        ),
        IconButton(
          onPressed: (){},
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.filter_list, color: Colors.black54, size: 32,),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

}