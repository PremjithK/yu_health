import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode _themeMode = ThemeMode.system;

  void setTheme(ThemeMode mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', mode.name);
    _themeMode = mode;
    notifyListeners();
  }

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('theme')) {
      String str = prefs.getString('theme')!;
      _themeMode = getThemeFromString(str);
      notifyListeners();
    } else {
      _themeMode = ThemeMode.system;
      notifyListeners();
    }
  }

  ThemeMode getThemeFromString(String themeStr) {
    if (themeStr == 'light') {
      return ThemeMode.light;
    } else if (themeStr == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  ThemeMode get themeMode => _themeMode;
}
