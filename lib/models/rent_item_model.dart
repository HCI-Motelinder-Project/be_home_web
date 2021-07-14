import 'package:be_home/constants/common_constant.dart';
import 'package:be_home/utils/app_utils.dart';

class RentItemModel {
  String id;
  int area;
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

  RentItemModel({
    this.address,
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
  });

  // This is a static method
  factory RentItemModel.fromJson(Map<String, dynamic> json) {
    return RentItemModel(
      address: json["address"],
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
      district: json["house"]["districtName"],
      distance: json["distance"],
      gender: ModelUtils.convertGenderFromResponse(json["gender"]),
      price: DataUtils.convertPriceFromResponse(json["price"]),
      imageCover: json["imageCover"] ?? DEFAULT_IMAGE,
      type: json["rentType"]["name"],
      rating: json["rating"],
      totalRating: json["totalRating"],
      houseId: json["houseId"],
    );
  }

  factory RentItemModel.fromApi(Map<String, dynamic> json) {
    return RentItemModel(
      imageCover: json["image"],
    );
  }
}
