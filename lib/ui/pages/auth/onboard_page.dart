import 'package:bloc_wall/ui/pages/animation/fade_animation.dart';
import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CustomNavbar()),
    );
  }
    Widget _buildImage(String assetName) {
    return Container(
      child: Image.asset('assets/$assetName.jpg', fit: BoxFit.cover,),
    );
  }
  monserrat(Color colors, double fontSize) {
      return GoogleFonts.montserrat(
          fontSize: fontSize, color: colors, fontWeight: FontWeight.w400);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      onDone: () => _onIntroEnd(context),
      done: Text('Done', style: monserrat(Colors.black, 15),),
      skip: Text('Skip', style: monserrat(Colors.black, 15),),
      next: Text('Next', style: monserrat(Colors.black, 15),),
      showSkipButton: true,
      showNextButton: true,
      skipFlex: 0,
      nextFlex: 0,
      key: introKey,
      dotsDecorator: DotsDecorator(
        size: Size(5.0, 10.0),
        color: Color.fromRGBO(143, 148, 151, .3),
        activeSize: Size(10.0, 10.0),
        activeColor: Color.fromRGBO(143, 148, 151, .9),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3))
        )
      ),
      pages: [
        PageViewModel(
          title: 'Set wallpaper',
          body: 'Instead of having to buy an entire share, invest any amount you want.',
          image: FadeAnimation(0.3, Container(
            child: _buildImage('login')
          )),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'two',
          body: 'Instead of having to buy an entire share, invest any amount you want.',
          image: FadeAnimation(0.3, Container(
            child: _buildImage('login')
          )),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'three',
          body: 'Instead of having to buy an entire share, invest any amount you want.',
          image: FadeAnimation(0.3, Container(
            child: _buildImage('login')
          ),),
          decoration: pageDecoration,
          footer: RaisedButton(
            onPressed: (){
              introKey.currentState?.animateScroll(0);
            },
          )
        ),
      ],
      onChange: (val){
        // _dynamicHeight = 500;
        print(val);
      },
    );
    // Scaffold(
    //   body: SingleChildScrollView(
    //     child: ConstrainedBox(
    //       constraints: BoxConstraints(
    //         minHeight: MediaQuery.of(context).size.height,
    //       ),
    //       child: FadeAnimation(
    //           0.1,
    //           Container(
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                     colorFilter:
    //                         ColorFilter.mode(Colors.black26, BlendMode.darken),
    //                     image: AssetImage('assets/login.jpg'),
    //                     fit: BoxFit.cover)),
    //             child: Column(
    //               children: <Widget>[
    //                 FadeAnimation(
    //                     1,
    //                     Container(
    //                       height: 300,
    //                       child: Stack(
    //                         children: <Widget>[
    //                           Positioned(
    //                             child: Container(),
    //                           ),
    //                           FadeAnimation(
    //                               1.1,
    //                               Positioned(
    //                                 child: Container(
    //                                   child: Center(
    //                                     child: Text(
    //                                       'Login',
    //                                       style: monserrat(Colors.white70, 55),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               )),
    //                         ],
    //                       ),
    //                     )),
    //                 Padding(
    //                   padding: EdgeInsets.all(30),
    //                   child: Column(
    //                     children: <Widget>[
    //                       FadeAnimation(
    //                           1.5,
    //                           Container(
    //                             height: 50,
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(10),
    //                                 gradient: LinearGradient(colors: [
    //                                   Color.fromRGBO(143, 248, 151, .7),
    //                                   Color.fromRGBO(143, 148, 951, .8),
    //                                 ])),
    //                             child: Center(
    //                               child: Text(
    //                                 'Sign In with Google',
    //                                 style: monserrat(Colors.white, 20),
    //                               ),
    //                             ),
    //                           )),
    //                       FadeAnimation(
    //                           1.5,
    //                           FlatButton(
    //                             onPressed: () {
    //                               Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                       builder: (context) =>
    //                                           CustomNavbar()));
    //                             },
    //                             child: Text(
    //                               'continue without login',
    //                               style: monserrat(Colors.grey[100], 17),
    //                             ),
    //                           ))
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           )),
    //     ),
    //   ),
    // );
  }
}
