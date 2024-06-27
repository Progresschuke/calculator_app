import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  int _currenTabPageIndex = 0;
  bool _rememberMe = false;

  int get currenTabPageIndex => _currenTabPageIndex;
  bool get rememberMe => _rememberMe;

  void seTabPageIndex(int index) {
    _currenTabPageIndex = index;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void reseTabPageIndex() {
    _currenTabPageIndex = 0;
    notifyListeners();
  }
}
