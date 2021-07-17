//@dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:behome/config/config.dart';
import 'package:behome/models/user_model.dart';
import 'package:behome/utils/app_utils.dart';
import 'package:dio/dio.dart';

String getRoleString(Role role) {
  switch (role) {
    case Role.ADMIN:
      return "Admin";
    case Role.RENTER:
      return "Renter";
    case Role.OWNER:
      return "Owner";
  }
}

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
    "email": model.email,
    "phone": model.phone,
    "fullName": model.name,
    "dateOfBirth": model.dateOfBirth,
    "roleId": "A4148B04-6730-4306-9980-11D0D416ABD0",
    "image": model.image,
  };
  final response = await new Dio().post('$API_URL/user/register',
      options:
          Options(headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
  } else {
    throw Exception(
        'Failed to load rent items from API:  ${response.toString()}');
  }
}

Future<List<UserModel>> loadUsers() async {
  try {
    final response = await new Dio().get('$API_URL/user/all');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      List<dynamic> rentData = mapResponse['accounts'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<UserModel> result = rentData
            .map((json) => UserModel.fromAccountsResponseJson(json))
            .toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception('Failed to load users from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}

Future<UserModel> disableUser(UserModel model) async {
  var request = model.id;
  var url = '$API_URL/user/disable';

  final response = await new Dio().put(url,
      options:
          Options(headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    print("Disable successfully");
  } else {
    throw Exception(
        'Failed to update facility from API:  ${response.toString()}');
  }
}

Future<UserModel> updateRole(UserModel model) async {
  print(model.id);
  var request = {
    "userId" : model.id,
    "role"  : getRoleString(model.role)
  };
  var url = '$API_URL/user/update/role';

  final response = await new Dio().put(url,
      options:
      Options(headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    print("Update role successfully");
  } else {
    throw Exception(
        'Failed to update facility from API:  ${response.toString()}');
  }
}
