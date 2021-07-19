import 'dart:async';

import 'package:flutter/widgets.dart';

class NavigationBloc with ChangeNotifier {
  StreamController<int> indexController = StreamController<int>();
  int currentIndex;

  static NavigationBloc _instance;

  static NavigationBloc getInstance() {
    if (_instance == null) {
      _instance = NavigationBloc._internal();
    }
    return _instance;
  }

  NavigationBloc._internal() {
    currentIndex = 0;
  }

  void setTabIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void dispose() {
    _instance = null;
    indexController.close();
  }
}
