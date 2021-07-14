//@dart=2.9
import 'dart:convert';
import 'dart:io';


import 'package:behome/config/config.dart';
import 'package:behome/models/user_model.dart';
import 'package:dio/dio.dart';

var users = [
  {
    "id": "1",
    "name": "Trường Thịnh",
    "phone": "0378693372",
    "email": "t@gmail.com",
    "password": "123456",
    "image": "",
    "address": "34 đường 26",
    "role": "0"
  }
];

Future<UserModel> checkLogin(String email, String password) async {
  final userData = await users.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => null);
  UserModel result = null;
  if (userData != null) {
    result = UserModel.fromJson(userData);
  }
  return result;
}


Future<UserModel> loginByGoogle() async {
  await Future.delayed(Duration(seconds: 1));
  UserModel result = UserModel.fromJson(users[0]);
  return result;
}

Future<UserModel> regiter(UserModel model) async {
  var request = {
    "email" : model.email,
    "phone": model.phone,
    "fullName" : model.name,
    "dateOfBirth" : model.dateOfBirth,
    "roleId" : "A4148B04-6730-4306-9980-11D0D416ABD0",
    "image" : model.image,
  };
  final response = await new Dio().post('$API_URL/user/register', options: Options(headers:{
    HttpHeaders
  .contentTypeHeader:'application/json' }), data: jsonEncode(request));
  if (response.statusCode == 200) {


  } else {
    throw Exception(
        'Failed to load rent items from API:  ${response.toString()}');
  }
}

