import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeService extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  static String themeModeToString(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      return 'dark';
    } else if (mode == ThemeMode.light) {
      return 'light';
    } else {
      return 'system';
    }
  }

  static ThemeMode stringToThemeMode(String mode) {
    if (mode == 'dark') {
      return ThemeMode.dark;
    } else if (mode == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  getThemeMode() => _themeMode;

  setThemeMode(ThemeMode mode) async {
    if (mode != _themeMode) {
      _themeMode = mode;
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme', themeModeToString(mode));
      notifyListeners();
    }
  }
}
