import 'dart:async';

import 'package:behome/models/location_model.dart';
import 'package:flutter/widgets.dart';

class LocationBloc with ChangeNotifier {
  StreamController<LocationModel> locationController =
      StreamController<LocationModel>.broadcast();
  LocationModel currentLocation;

  static LocationBloc _instance;

  static LocationBloc getInstance() {
    if (_instance == null) {
      _instance = LocationBloc._internal();
    }
    return _instance;
  }

  LocationBloc._internal();

  void locationSelected(LocationModel location) {
    locationController.sink.add(location);
  }

  void setLocationByMovingMap(LocationModel location) {
    currentLocation = location;
  }

  void dispose() {
    _instance = null;
    locationController.close();
  }
}
