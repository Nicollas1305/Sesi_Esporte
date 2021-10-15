import 'package:flutter/material.dart';

class DarkController extends ChangeNotifier {
  static DarkController instance = DarkController();

  bool isDarkMode = false;
  changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
