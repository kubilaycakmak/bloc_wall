import 'dart:ui';
import 'package:bloc_wall/data/injection_container.dart';
import 'package:bloc_wall/ui/global/theme/bloc/theme_bloc.dart';
import 'package:bloc_wall/ui/pages/widget/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initKiwi();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }
}

Widget _buildWithTheme(BuildContext context, ThemeState state) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: state.themeData,
    home: CustomNavbar(),
    // supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
    // localizationsDelegates: [
    //   AppLocalizations.delegate,
    //   GlobalWidgetsLocalizations.delegate,
    //   // GlobalMaterialLocalizations.delegate,
    // ],
    // localeResolutionCallback: (locale, supportedLocales){
    //   for(var supportedLocale in supportedLocales){
    //     if(supportedLocale.languageCode == locale.languageCode
    //       && supportedLocale.countryCode == locale.countryCode){
    //       return supportedLocale;
    //     }
    //   }
    //   return supportedLocales.first;
    // }
  );
}
