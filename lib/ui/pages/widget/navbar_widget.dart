// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Positioned(
//           child: ClipRect(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//               child: Container(
//                 margin: EdgeInsets.only(left: 25, right: 25, bottom: 13),
//                 height: 75,
//                 decoration: new BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//               ),
//             ),
//         ),
//       ),
//         Positioned(
//           bottom: 30,
//           width: MediaQuery.of(context).size.width,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               _buildNavItem(_selectedIndex == 0 ? Icons.home : CupertinoIcons.home, 0, 'Home'),
//               SizedBox(width: 0.5),
//               _buildNavItem(_selectedIndex == 1 ? CupertinoIcons.collections : CupertinoIcons.collections_solid, 1, 'Category'),
//               SizedBox(width: 0.5),
//               _buildNavItem(_selectedIndex == 2 ? Icons.favorite : Icons.favorite_border, 2, 'Favorite'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//     _buildNavItem(IconData icon, int index, String title) {
//     return InkWell(
//       onTap: (){
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Column(
//         children: <Widget>[
//           CircleAvatar(
//             radius: 20,
//             child: CircleAvatar(
//               radius: 25,
//               backgroundColor:
//                   index == _selectedIndex ? Colors.white.withOpacity(0.9) : Color(0xFF060B4B),
//               child: Icon(
//                 icon,
//                 color: index == _selectedIndex ? Color(0xFF060B4B) : Colors.white.withOpacity(0.9),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   } 
// }