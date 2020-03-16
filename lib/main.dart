import 'package:bloc_wall/data/injection_container.dart';
import 'package:bloc_wall/ui/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  initKiwi();
  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark));
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
