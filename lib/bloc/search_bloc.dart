import 'dart:async';

import 'package:flutter/widgets.dart';

class SearchBloc with ChangeNotifier {
  StreamController<String> searchController =
  StreamController<String>.broadcast();
  String searchValue;

  static SearchBloc _instance;

  static SearchBloc getInstance() {
    if (_instance == null) {
      _instance = SearchBloc._internal();
    }
    return _instance;
  }

  SearchBloc._internal();

  void setSearchTextWithoutNotify(String searchText) {
    if (searchText != null && searchText.isEmpty) {
      searchText = null;
    }
    searchValue = searchText;
  }

  void clearSearchText() {
    searchValue = null;
  }

  void dispose() {
    _instance = null;
    searchController.close();
  }
}