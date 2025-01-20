import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel with ChangeNotifier {
  late SharedPreferences _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  ThemeViewModel() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    final themeModeIndex = _prefs.getInt('themeMode') ?? ThemeMode.system.index;
    _themeMode = ThemeMode.values[themeModeIndex];
    notifyListeners();
  }

  Future<void> _saveThemeMode() async {
    await _prefs.setInt('themeMode', _themeMode.index);
  }

  bool get isDarkTheme {
    return _themeMode == ThemeMode.dark ||
        (_themeMode == ThemeMode.system &&
            // WidgetsBinding.instance.window.platformBrightness == Brightness.dark);
            PlatformDispatcher.instance.platformBrightness == Brightness.dark);
  }

  void toggleTheme() {
    if (isDarkTheme) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    _saveThemeMode();
    notifyListeners();
  }
}
