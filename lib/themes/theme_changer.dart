import 'package:flutter/material.dart';

import '../controllers/shared_preferences.controller.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeChanger with ChangeNotifier {
  SharedPreferencesController sharedPreferencesController =
      SharedPreferencesController();

  bool _darkStatus = false;
  bool isDark() => _darkStatus;

  ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  Future<void> setInitialTheme() async {
    String? value = await sharedPreferencesController.readData('themeMode');

    String themeMode = value ?? 'dark';

    if (themeMode == 'light') {
      setLightMode();
    } else {
      setDarkMode();
    }
  }

  void setThemeMode(bool value) {
    if (value) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }

  Future<void> setDarkMode() async {
    _themeData = darkTheme;
    _darkStatus = true;
    await sharedPreferencesController.insertData('themeMode', 'dark');
    notifyListeners();
  }

  Future<void> setLightMode() async {
    _themeData = lightTheme;
    _darkStatus = false;
    await sharedPreferencesController.insertData('themeMode', 'light');
    notifyListeners();
  }
}
