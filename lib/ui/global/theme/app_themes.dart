import 'package:flutter/material.dart';

enum AppTheme { LightMode, DarkMode, DeepDark, TealDark }

final appThemeData = {
  AppTheme.LightMode:
      ThemeData(brightness: Brightness.light, primaryColor: Colors.white),
  AppTheme.DarkMode:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.grey[800]),
  AppTheme.TealDark:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.teal[800]),
  AppTheme.DeepDark:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.black),
};
