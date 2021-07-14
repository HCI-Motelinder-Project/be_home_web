//@dart=2.9
class BookingSlotModel {
  String id;
  String startTime;
  String endTime;
  String houseId;

  BookingSlotModel({this.id, this.startTime, this.endTime, this.houseId});

  factory BookingSlotModel.fromJson(Map<String, dynamic> json) {
    return BookingSlotModel(
        id: json["id"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        houseId: json["houseId"]);
  }
}
