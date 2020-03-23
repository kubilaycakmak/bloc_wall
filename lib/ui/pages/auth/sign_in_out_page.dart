import 'package:bloc_wall/ui/pages/animation/fade_animation.dart';
import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInOutPage extends StatelessWidget {
  const SignInOutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    monserrat(Color colors, double fontSize) {
      return GoogleFonts.montserrat(
          fontSize: fontSize, color: colors, fontWeight: FontWeight.w400);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: FadeAnimation(
              0.1,
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black26, BlendMode.darken),
                        image: AssetImage('assets/login.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Container(
                          height: 300,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Container(),
                              ),
                              Positioned(
                                child: Container(),
                              ),
                              FadeAnimation(
                                  1.1,
                                  Positioned(
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: monserrat(Colors.white70, 55),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.3,
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white12,
                                          blurRadius: 10.0,
                                          offset: Offset(0, 5))
                                    ]),
                                child: FadeAnimation(
                                    1.3,
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[200]))),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Email address",
                                                hintStyle: monserrat(
                                                    Colors.white, 18)),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: monserrat(
                                                    Colors.white, 18)),
                                          ),
                                        ),
                                      ],
                                    )),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.4,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, .5),
                                      Color.fromRGBO(143, 148, 251, .8),
                                    ])),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: monserrat(Colors.white, 20),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                              1.5,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color.fromRGBO(143, 248, 151, .7),
                                      Color.fromRGBO(143, 148, 951, .8),
                                    ])),
                                child: Center(
                                  child: Text(
                                    'Sign In with Google',
                                    style: monserrat(Colors.white, 20),
                                  ),
                                ),
                              )),
                          FadeAnimation(
                              1.5,
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomNavbar()));
                                },
                                child: Text(
                                  'continue without login',
                                  style: monserrat(Colors.grey[100], 17),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
