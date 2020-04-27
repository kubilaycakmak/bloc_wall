// import 'package:bloc_wall/ui/pages/animation/fade_animation.dart';
// import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../app_localizations.dart';

// class OnboardPage extends StatefulWidget {
//   const OnboardPage({Key key}) : super(key: key);

//   @override
//   _OnboardPageState createState() => _OnboardPageState();
// }

// class _OnboardPageState extends State<OnboardPage> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//   void _onIntroEnd(context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => CustomNavbar()),
//     );
//   }

//   Widget _buildImage(String assetName) {
//     return Container(
//       child: Image.asset(
//         'assets/$assetName.jpg',
//         fit: BoxFit.cover,
//       ),
//     );
//   }

//   monserrat(Color colors, double fontSize) {
//     return GoogleFonts.montserrat(
//         fontSize: fontSize, color: colors, fontWeight: FontWeight.w400);
//   }

//   @override
//   Widget build(BuildContext context) {
//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       bodyTextStyle: TextStyle(fontSize: 19),
//       descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
//       pageColor: Colors.white,
//       imagePadding: EdgeInsets.zero,
//     );
//     return IntroductionScreen(
//       onDone: () => _onIntroEnd(context),
//       done: Text(
//         AppLocalizations.of(context).translate('onBoard-skip'),
//         style: monserrat(Colors.black, 15),
//       ),
//       skip: Text(
//         AppLocalizations.of(context).translate('onBoard-done'),
//         style: monserrat(Colors.black, 15),
//       ),
//       next: Text(
//         AppLocalizations.of(context).translate('onBoard-next'),
//         style: monserrat(Colors.black, 15),
//       ),
//       showSkipButton: true,
//       showNextButton: true,
//       skipFlex: 0,
//       nextFlex: 0,
//       key: introKey,
//       dotsDecorator: DotsDecorator(
//           size: Size(5.0, 10.0),
//           color: Color.fromRGBO(143, 148, 151, .3),
//           activeSize: Size(10.0, 10.0),
//           activeColor: Color.fromRGBO(143, 148, 151, .9),
//           activeShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(3)))),
//       pages: [
//         PageViewModel(
//           title: AppLocalizations.of(context).translate('onBoard-1-Title'),
//           body: AppLocalizations.of(context).translate('onBoard-1-Body'),
//           image: FadeAnimation(0.3, Container(child: _buildImage('login'))),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: AppLocalizations.of(context).translate('onBoard-2-Title'),
//           body: AppLocalizations.of(context).translate('onBoard-2-Body'),
//           image: FadeAnimation(0.3, Container(child: _buildImage('login'))),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//             title: AppLocalizations.of(context).translate('onBoard-3-Title'),
//             body: AppLocalizations.of(context).translate('onBoard-3-Body'),
//             image: FadeAnimation(
//               0.3,
//               Container(child: _buildImage('login')),
//             ),
//             decoration: pageDecoration,
//             footer: RaisedButton(
//               child: Text(
//                 AppLocalizations.of(context).translate('onBoard-returnBegin'),
//               ),
//               onPressed: () {
//                 introKey.currentState?.animateScroll(0);
//               },
//             )),
//       ],
//       onChange: (val) {
//         print(val);
//       },
//     );
//   }
// }
