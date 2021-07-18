//@dart=2.9
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:behome/config/config.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:behome/utils/app_utils.dart';
import 'package:dio/dio.dart';

Future<RentItemModel> fetchRentEntityById(String id) async {
  if (id == null) {
    return null;
  }
  final response = await new Dio().get('$API_URL/rent?id=' + id);
  if (response.statusCode == 200) {
    Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
    RentItemModel rentItem = RentItemModel.fromJson(map);
    return rentItem;
  } else {
    throw Exception(
        'Failed to load rent items from API:  ${response.toString()}');
  }
}

Future<List<RentItemModel>> fetchRentItems() async {
  try {
    final response = await new Dio().get('$API_URL/rent');
    if (response.statusCode == 200) {
      print(response.data.toString());
      Map<String, dynamic> mapResponse = response.data;
      dev.log(response.data.toString());
      List<dynamic> rentData = mapResponse['rentEntities'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<RentItemModel> result = rentData
            .map((json) => RentItemModel.fromResponseJson(json))
            .toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception(
          'Failed to load rent items from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}

Future<List<RentItemModel>> loadAllRentEntities() async {
  try {
    final response = await new Dio().get('$API_URL/rent');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      List<dynamic> rentData = mapResponse['rentEntities'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<RentItemModel> result = rentData
            .map((json) => RentItemModel.fromResponseJson(json))
            .toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception(
          'Failed to load facilities from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}

Future<List<RentItemModel>> loadPendingRentEntities() async {
  try {
    final response = await new Dio().get('$API_URL/rent/pending');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      List<dynamic> rentData = mapResponse['rentEntities'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<RentItemModel> result = rentData
            .map((json) => RentItemModel.fromResponseJson(json))
            .toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception(
          'Failed to load facilities from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}

Future<List<RentItemModel>> loadRejectedRentEntities() async {
  try {
    final response = await new Dio().get('$API_URL/rent/reject');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      List<dynamic> rentData = mapResponse['rentEntities'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<RentItemModel> result = rentData
            .map((json) => RentItemModel.fromResponseJson(json))
            .toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception(
          'Failed to load facilities from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}

Future<List<RentItemModel>> loadUnavailableRentEntities() async {
  try {
    final response = await new Dio().get('$API_URL/rent/unavailable');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      List<dynamic> rentData = mapResponse['rentEntities'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<RentItemModel> result = rentData
            .map((json) => RentItemModel.fromResponseJson(json))
            .toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception(
          'Failed to load facilities from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}

Future<RentItemModel> updateRentEntity(RentItemModel model) async {
  var request = {
    "rentEntityId": model.id,
    "name": model.name,
    "description": model.description,
    "rentTypeId": model.rentTypeId,
    "houseId": model.houseId,
    "isLatest": true,
    "price": model.priceInt,
    "area": model.area,
    "gender": ModelUtils.convertGenderToInt(model.gender),
    "image": model.imageCover,
    "isSharing": true,
    "disableTime": null,
    "updateTime": null,
    "status": model.status
  };
  var url = '$API_URL/updaterent';

  final response = await new Dio().put(url,
      options:
      Options(headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    print("Update successfully");
  } else {
    throw Exception(
        'Failed to update facility from API:  ${response.toString()}');
  }
}