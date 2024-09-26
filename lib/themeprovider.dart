import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  // bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    _saveTheme();
    notifyListeners();
  }

  ThemeData get currentTheme {
    return isDarkMode
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
  }

  void _loadTheme() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    isDarkMode = prefes.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  void _saveTheme() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    await prefes.setBool('isDarkMode', isDarkMode);
  }
}
