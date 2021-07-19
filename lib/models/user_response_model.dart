import 'package:behome/models/user_model.dart';

class UserResponseModel {
  int statusCode;
  UserModel user;
  UserResponseModel({
    this.statusCode,
    this.user,
  });
}
