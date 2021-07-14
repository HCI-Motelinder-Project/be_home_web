//@dart=2.9
import 'dart:math';
import 'package:behome/models/booking_slot_model.dart';

var slotData = [
  {"id": "1", "startTime": "7:00", "endTime": "8:00", "houseId": "1"},
  {"id": "2", "startTime": "8:00", "endTime": "9:00", "houseId": "2"},
  {"id": "3", "startTime": "9:00", "endTime": "10:00", "houseId": "1"},
  {"id": "4", "startTime": "10:00", "endTime": "11:00", "houseId": "4"},
  {"id": "5", "startTime": "11:00", "endTime": "12:00", "houseId": "2"},
  {"id": "6", "startTime": "13:00", "endTime": "14:00", "houseId": "1"},
  {"id": "7", "startTime": "14:00", "endTime": "15:00", "houseId": "2"},
  {"id": "8", "startTime": "15:00", "endTime": "16:00", "houseId": "4"},
  {"id": "9", "startTime": "16:00", "endTime": "17:00", "houseId": "1"},
  {"id": "10", "startTime": "17:00", "endTime": "18:00", "houseId": "1"}
];

Future<List<dynamic>> fetchBookingSlotByDate(DateTime date) async {
  await Future.delayed(Duration(seconds: 1));
  Random rnd = new Random();
  int length = rnd.nextInt(10);
  List<bool> tmp = [];
  for (int i = 0; i < 10; i++) {
    tmp.add(false);
  }
  var result = [];
  while (result.length < length) {
    int idx = rnd.nextInt(10);
    if (tmp[idx]) {
      continue;
    }
    result.add(slotData[idx]);
    tmp[idx] = true;
  }

  result.sort((a, b) {
    var aTime =
        a['startTime'].length == 5 ? a['startTime'] : '0${a['startTime']}';
    var bTime =
        b['startTime'].length == 5 ? b['startTime'] : '0${b['startTime']}';
    return aTime.compareTo(bTime);
  });
  return result;
}

BookingSlotModel fetchBookingSlotById(String id) {
  if (id == null) {
    return null;
  }
  Map<String, dynamic> dataResponse =
      slotData.firstWhere((item) => item['id'] == id);
  if (dataResponse != null) {
    final bookingSlot = BookingSlotModel.fromJson(dataResponse);
    return bookingSlot;
  } else {
    return null;
  }
}
