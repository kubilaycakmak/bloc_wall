import 'package:bloc_wall/data/injection_container.dart';
import 'package:bloc_wall/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  initKiwi();
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
