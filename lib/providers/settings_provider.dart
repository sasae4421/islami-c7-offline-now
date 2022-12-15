import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
    notifyListeners();
  }

  String getMAinBackgroundImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/main_background_dark.png';
  }

  String languageCode = 'en';

  void changeLanguage(String lang) {
    if (languageCode == lang) return;
    languageCode = lang;
    notifyListeners();
  }

  bool isDarkMood() {
    return currentTheme == ThemeMode.dark;
  }

  bool isEnglish() {
    return languageCode == 'en';
  }
}
