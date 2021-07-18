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
  String status;
  List<int> facilities;
  List<int> services;
  String houseId;
  String ownerName;
  String description;
  String rentTypeId;
  int priceInt;

  RentItemModel({
    this.id,
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
    this.houseId,
    this.ownerName,
    this.status,
    this.description,
    this.rentTypeId,
    this.priceInt,
    this.services,
  });

  // This is a static method
  factory RentItemModel.fromJson(Map<String, dynamic> json) {
    return RentItemModel(
      id: json["rentEntityId"],
      address: json["address"],
      name: json["name"],
      area: json["area"],
      district: json["district"],
      distance: json["distance"],
      gender: json["gender"],
      price: json["price"],
      imageCover: json["imageCover"],
      type: json["type"],
    );
  }

  factory RentItemModel.fromResponseJson(Map<String, dynamic> json) {
    return RentItemModel(
      id: json["rentEntityId"],
      address: json["house"]["address"],
      area: json["area"],
      name: json["name"],
      district: json["house"]["districtName"],
      distance:
          json["distance"] != null ? json["rentEntities"]["distance"] : "~500m",
      gender: ModelUtils.convertGenderFromResponse(json["gender"]),
      price: DataUtils.convertPriceFromResponse(json["price"]),
      priceInt: json["price"],
      imageCover: json["image"] ?? DEFAULT_IMAGE,
      type: json["rentType"]["name"],
      houseId: json["house"]["houseId"],
      ownerName: json["house"]["ownerName"],
      status: json["status"],
      description: json["description"],
      rentTypeId: json["rentType"]["rentTypeId"],
      facilities: ModelUtils.convertFacilityToIcon(json["rentFacility"]),
      services: ModelUtils.convertServiceToIcon(json["rentService"]),
    );
  }

  factory RentItemModel.fromApi(Map<String, dynamic> json) {
    return RentItemModel(
      imageCover: json["image"],
    );
  }
}
