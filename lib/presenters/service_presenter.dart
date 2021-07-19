import 'dart:convert';
import 'dart:io';

import 'package:behome/config/config.dart';
import 'package:behome/models/service_model.dart';
import 'package:behome/utils/app_utils.dart';
import 'package:dio/dio.dart';

Future<ServiceModel> createService(ServiceModel model) async {
  var request = {
    "name" : model.name,
    "icon" : model.icon,
    "status" : "Available"
  };
  var url = '$API_URL/services/create';

  final response = await new Dio().post(url,
      options: Options(
          headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
    ServiceModel user = ServiceModel.fromJson(map);
    return user;
  } else {
    throw Exception(
        'Failed to create facility from API:  ${response.toString()}');
  }
}

Future<List<ServiceModel>> loadServices() async {
  try {
    final response = await new Dio().get('$API_URL/services');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      List<dynamic> servicesData = mapResponse['services'];
      if (!CollectionUtils.isEmpty(servicesData)) {
        List<ServiceModel> result = servicesData
            .map((json) => ServiceModel.fromResponseJson(json))
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

Future<ServiceModel> updateService(ServiceModel model) async {
  print(model.id);
  var request = {
    "serviceId" : model.id,
    "name" : model.name,
    "icon" : model.icon,
    "status" : "Unavailable"
  };
  var url = '$API_URL/services/update';

  final response = await new Dio().put(url,
      options: Options(
          headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
    ServiceModel user = ServiceModel.fromJson(map);
    return user;
  } else {
    throw Exception(
        'Failed to update facility from API:  ${response.toString()}');
  }
}

Future<int> getAllServiceCount() async {
  try {
    final response = await new Dio().get('$API_URL/services/count');
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = response.data;
      int count = mapResponse["count"];
      if (count >= 0) {
        return count;
      }
      return null;
    } else {
      throw Exception(
          'Failed to load rent items from API:  ${response.toString()}');
    }
  } on DioError catch (e) {
    print(e);
  }
}