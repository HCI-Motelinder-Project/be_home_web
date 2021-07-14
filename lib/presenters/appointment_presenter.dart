//@dart=2.9
import 'dart:convert';

import 'package:behome/config/config.dart';
import 'package:behome/config/credentials.dart';
import 'package:behome/models/appointment_model.dart';
import 'package:behome/models/booking_slot_model.dart';
import 'package:behome/models/rent_item_model.dart';
import 'package:behome/presenters/rent_item_presenter.dart';
import 'package:dio/dio.dart';

import 'booking_slot_presenter.dart';
import 'house_presenter.dart';

Future<List<AppointmentModel>> fetchAppointments([status]) async {
  final response = await new Dio().get(
      '$BASE_API_URL/appointments${status != null ? '?status=$status' : ''}${status != null ? '&' : '?'}sortBy=date');
  if (response.statusCode == 200) {
    List<dynamic> listResponse = response.data;
    if (listResponse.length > 0) {
      final listAppointment = listResponse.map<AppointmentModel>((json) {
        AppointmentModel appointmentModel = AppointmentModel.fromJson(json);
        RentItemModel rentItem = fetchRentEntityById(json["rentEntityId"]) as RentItemModel;
        if (rentItem != null) {
          appointmentModel.rentItemImage = rentItem.imageCover;
        }
        BookingSlotModel bookingSlotModel =
            fetchBookingSlotById(json["slotId"]);
        if (bookingSlotModel != null) {
          appointmentModel.startTime = bookingSlotModel.startTime;
          appointmentModel.endTime = bookingSlotModel.endTime;
          fetchHouseById(bookingSlotModel.houseId).then((house) {
            if (house != null) {
              appointmentModel.address = house.address;
              appointmentModel.ownerName = house.ownerName;
            }
          });
        }
        return appointmentModel;
      }).toList();
      return listAppointment;
    } else {
      return [];
    }
  } else {
    throw Exception(
        'Failed to load Appointment from the Internet:  ${response.toString()}');
  }
}

Future<AppointmentModel> addAppointments(Map<String, dynamic> params) async {
  final response = await new Dio().post('$API_URL/appointments',
      data: jsonEncode(params),
      options: Options(headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }));
  if (response.statusCode == 201) {
    dynamic mapResponse = response.data;
    if (mapResponse != null) {
      return AppointmentModel.fromJson(mapResponse);
    } else {
      return AppointmentModel();
    }
  } else {
    throw Exception(
        'Failed to update Task from the Internet: ${response.toString()}');
  }
}
