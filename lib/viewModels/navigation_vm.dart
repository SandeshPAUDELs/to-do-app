import 'package:flutter/material.dart' show ChangeNotifier;

class NavigationViewModel extends ChangeNotifier {
  int _currentHomeIndex = 0;
  int get currentHomeIndex => _currentHomeIndex;

  int _currentPMIndex = 0;
  int get currentPMIndex => _currentPMIndex;


  void changeHomeIndex(int newIndex) {
    _currentHomeIndex = newIndex;
    notifyListeners();
  }

  void changePMIndex(int newIndex) {
    _currentPMIndex = newIndex;
    notifyListeners();
  }

}
