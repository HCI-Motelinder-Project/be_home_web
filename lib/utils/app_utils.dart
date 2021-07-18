//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CollectionUtils {
  static bool isEmpty(List<Object> list) {
    return list == null || list.length == 0;
  }
}

class ModelUtils {
  static String convertGenderFromResponse(int i) {
    switch (i) {
      case 1:
        return "Nam";
      case 2:
        return "Nữ";
      default:
        return "Nam & Nữ";
    }
  }

  static int convertGenderToInt(String gender) {
    switch (gender) {
      case "Nam":
        return 1;
      case "Nữ":
        return 2;
      default:
        return 3;
    }
  }

  static List<int> convertFacilityToIcon(List<dynamic> data) {
    return data.map((json) => int.parse(json['facility']['icon'])).toList();
  }

  static List<int> convertServiceToIcon(List<dynamic> data) {
    return data.map((json) => int.parse(json['service']['icon'])).toList();
  }
}

class DataUtils {
  static final vnConcurrency = NumberFormat.compactLong(
    locale: 'vi-VN',
  );

  static String convertPriceFromResponse(dynamic x) {
    return vnConcurrency.format(x);
  }

  static bool isEmpty(List<Object> list) {
    return list == null || list.length == 0;
  }
}

class TimeUtils {
  static DateTime convertToDateTime(String date, String time, int year) {
    year = year ?? DateTime.now().year;
    int month;
    int day;
    int hour;
    int min;
    date = date ?? "1/1";
    day = int.parse(date.split("/")[0]);
    month = int.parse(date.split("/")[1]);
    time = time ?? "0:0";
    hour = int.parse(time.split(":")[0]);
    min = int.parse(time.split(":")[1]);
    return DateTime(year, month, day, hour, min);
  }
}
