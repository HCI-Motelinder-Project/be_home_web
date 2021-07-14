import 'package:be_home/models/user_model.dart';

class UserResponse {
  int statusCode;
  UserModel user;
  UserResponse({
    this.statusCode,
    this.user,
  });
}
