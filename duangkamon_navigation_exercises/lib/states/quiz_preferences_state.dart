import 'package:flutter/material.dart';

//โค้ดตามเอกสาร document
class QuizPreferencesState extends ChangeNotifier {
  String userName       = 'Guest';
  String userBio        = 'Quiz Lover';
  bool   soundEnabled   = true;
  bool   vibrationEnabled = true;
  ThemeMode themeMode   = ThemeMode.system;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }
  void setUserBio(String bio) {
    userBio = bio;
    notifyListeners();
  }

  void setVibrationEnabled(bool enabled) {
    vibrationEnabled = enabled;
    notifyListeners();
  }
  void setSoundEnabled(bool enabled) {
    soundEnabled = enabled;
    notifyListeners();
  }
  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}