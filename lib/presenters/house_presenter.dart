//@dart=2.9
import 'package:behome/config/credentials.dart';
import 'package:behome/models/house_model.dart';
import 'package:behome/utils/app_utils.dart';
import 'package:dio/dio.dart';

Future<HouseModel> fetchHouseById(String id) async {
  final response = await new Dio().get('$BASE_API_URL/rent/' + id);
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = response.data;
    dynamic rentData = mapResponse['house'];
    if (!CollectionUtils.isEmpty(rentData)) {
      HouseModel result =
          rentData.map((json) => HouseModel.fromResponseJson(json));
      return result;
    }
    return null;
  } else {
    throw Exception(
        'Failed to load rent items from API:  ${response.toString()}');
  }
}
