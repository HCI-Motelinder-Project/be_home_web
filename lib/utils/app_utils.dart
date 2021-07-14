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

  static Icon convertFacilityToIcon(String facility) {
    switch (facility) {
      case 'wifi':
        return Icon(MdiIcons.wifi);
      case 'wc':
        return Icon(MdiIcons.toilet);
      case 'furniture':
        return Icon(MdiIcons.sofaSingle);
      case 'ac':
        return Icon(MdiIcons.airConditioner);
      case 'parking':
        return Icon(MdiIcons.parking);
      case 'washing':
        return Icon(MdiIcons.washingMachine);
      case 'fridge':
        return Icon(MdiIcons.fridge);
      default:
        return null;
    }
  }
}

class DataUtils {
  static final vnConcurrency = NumberFormat.currency(
    locale: 'vi-VN',
    symbol: 'đ',
  );

  static String convertPriceFromResponse(dynamic x) {
    return vnConcurrency.format(x);
  }
}
