import 'dart:async';

import 'package:behome/models/user_model.dart';
import 'package:flutter/widgets.dart';

class UserBloc with ChangeNotifier {
  StreamController<UserModel> userController = StreamController<UserModel>();
  UserModel user;

  static UserBloc _instance;

  static UserBloc getInstance() {
    if (_instance == null) {
      _instance = UserBloc._internal();
    }
    return _instance;
  }

  UserBloc._internal();

  void setUser(UserModel user) {
    this.user = user;
    notifyListeners();
  }

  void dispose() {
    _instance = null;
    userController.close();
  }

  void logOut()
  {
    this.user = null;
  }
}
