//@dart=2.9
import 'dart:developer' as dev;


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

  try
  {
    final response = await new Dio().get('$API_URL/rent');
    if (response.statusCode == 200) {
      print(response.data.toString());
      Map<String, dynamic> mapResponse = response.data;
      dev.log(response.data.toString());
      List<dynamic> rentData = mapResponse['rentEntities'];
      if (!CollectionUtils.isEmpty(rentData)) {
        List<RentItemModel> result =
        rentData.map((json) => RentItemModel.fromResponseJson(json)).toList();
        return result;
      }
      return List.empty();
    } else {
      throw Exception(
          'Failed to load rent items from API:  ${response.toString()}');
    }
  }on DioError catch(e)
  {
    print(e);
  }




}
