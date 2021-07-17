import 'dart:convert';
import 'dart:io';

import 'package:behome/config/config.dart';
import 'package:behome/models/facility_model.dart';
import 'package:behome/utils/app_utils.dart';
import 'package:dio/dio.dart';

Future<FacilityModel> createFacility(FacilityModel model) async {
  var request = {
    "name" : model.name,
    "icon" : model.icon,
    "status" : "Available"
  };
  var url = '$API_URL/facilities/create';

  final response = await new Dio().post(url,
      options: Options(
          headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
    FacilityModel user = FacilityModel.fromJson(map);
    return user;
  } else {
    throw Exception(
        'Failed to create facility from API:  ${response.toString()}');
  }
}

Future<List<FacilityModel>> loadFacilities() async {
  try {
    final response = await new Dio().get('$API_URL/facilities');
    if (response.statusCode == 200) {
      List<dynamic> facilities = response.data;
      if (!CollectionUtils.isEmpty(facilities)) {
        List<FacilityModel> result = facilities
            .map((json) => FacilityModel.fromResponseJson(json))
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

Future<FacilityModel> updateFacility(FacilityModel model) async {
  print(model.id);
  var request = {
    "facilityId" : model.id,
    "name" : model.name,
    "icon" : model.icon,
    "status" : "Unavailable"
  };
  var url = '$API_URL/facilities/update';

  final response = await new Dio().put(url,
      options: Options(
          headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      data: jsonEncode(request));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
    FacilityModel user = FacilityModel.fromJson(map);
    return user;
  } else {
    throw Exception(
        'Failed to update facility from API:  ${response.toString()}');
  }
}

