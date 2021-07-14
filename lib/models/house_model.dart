import 'package:behome/constraint/common_constant.dart';

class HouseModel {
  String houseId;
  String name;
  String wardId;
  String address;
  String disableTime;
  String status;
  String image;
  String updateTime;
  String ownerName;

  HouseModel(
      {this.houseId,
      this.name,
      this.wardId,
      this.address,
      this.disableTime,
      this.status,
      this.image,
      this.ownerName,
      this.updateTime});

  // This is a static method
  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
        houseId: json["houseId"],
        name: json["name"],
        wardId: json["wardId"],
        address: json["address"],
        disableTime: json["disableTime"],
        status: json["status"],
        ownerName: json["ownerName"],
        image: json["image"],
        updateTime: json["updateTime"]);
  }

  factory HouseModel.fromResponseJson(Map<String, dynamic> json) {
    return HouseModel(
        houseId: json["houseId"],
        name: json["name"],
        wardId: json["wardId"],
        address: json["address"],
        disableTime: json["disableTime"],
        status: json["status"],
        image: json["image"] ?? DEFAULT_IMAGE,
        updateTime: json["updateTime"]);
  }
}
