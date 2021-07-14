//@dart=2.9

import 'package:behome/constraint/common_constant.dart';
import 'package:behome/utils/app_utils.dart';

class RentItemModel {
  String id;
  int area;
  String name;
  String district;
  String address;
  String distance;
  String price;
  String gender;
  String imageCover;
  String type;
  List<String> facilities;
  double rating;
  int totalRating;
  String houseId;
  String ownerName;

  RentItemModel({
    this.address,
    this.name,
    this.area,
    this.district,
    this.distance,
    this.gender,
    this.price,
    this.imageCover,
    this.type,
    this.facilities,
    this.rating,
    this.totalRating,
    this.houseId,
    this.ownerName,
  });

  // This is a static method
  factory RentItemModel.fromJson(Map<String, dynamic> json) {
    return RentItemModel(
      address: json["address"],
      name: json["name"],
      area: json["area"],
      district: json["district"],
      distance: json["distance"],
      gender: json["gender"],
      price: json["price"],
      imageCover: json["imageCover"],
      type: json["type"],
      rating: json["rating"],
      totalRating: json["totalRating"],
    );
  }

  factory RentItemModel.fromResponseJson(Map<String, dynamic> json) {
    return RentItemModel(
      address: json["house"]["address"],
      area: json["area"],
      name: json["name"],
      district: json["house"]["districtName"],
      distance:
          json["distance"] != null ? json["rentEntities"]["distance"] : "~500m",
      gender: ModelUtils.convertGenderFromResponse(json["gender"]),
      price: DataUtils.convertPriceFromResponse(json["price"]),
      imageCover: json["image"] ?? DEFAULT_IMAGE,
      type: json["rentType"]["name"],
      rating: 4.0,
      totalRating: 50,
      houseId: json["houseId"],
      ownerName: json["house"]["ownerName"]
    );
  }

  factory RentItemModel.fromApi(Map<String, dynamic> json) {
    return RentItemModel(
      imageCover: json["image"],
    );
  }
}
