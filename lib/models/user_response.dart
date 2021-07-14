//@dart=2.9

import 'package:behome/models/user_model.dart';

class UserResponse {
  int statusCode;
  UserModel user;
  UserResponse({
    this.statusCode,
    this.user,
  });
}
