class AppointmentModel {
  String appointmentId;
  String time;
  String status;
  String rentEntityId;
  String renterName;
  String renterPhone;
  String renterEmail;
  String note;
  String slotId;
  String abortReason;
  String abortTime;
  String acceptTime;
  String updateTime;
  String startTime;
  String endTime;
  String rentItemImage;
  String ownerName;
  String address;
  String date;

  AppointmentModel({
    this.appointmentId,
    this.time,
    this.status,
    this.rentEntityId,
    this.renterName,
    this.renterPhone,
    this.renterEmail,
    this.note,
    this.slotId,
    this.abortReason,
    this.abortTime,
    this.acceptTime,
    this.updateTime,
    this.date,
  });

  // This is a static method
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentId: json["appointmentId"],
      time: json["time"],
      status: json["status"],
      rentEntityId: json["rentEntityId"],
      renterName: json["renterName"],
      renterEmail: json["renterEmail"],
      renterPhone: json["renterPhone"],
      note: json["note"],
      slotId: json["slotId"],
      abortReason: json["abortReason"],
      abortTime: json["abortTime"],
      acceptTime: json["acceptTime"],
      updateTime: json["updateTime"],
      date: json["date"],
    );
  }
}

AppointmentStatus getStatus(String status) {
  switch (status) {
    case "pending":
      return AppointmentStatus.PENDING;
    case "approved":
      return AppointmentStatus.APPROVED;
    case "rejected":
      return AppointmentStatus.REJECTED;
    default:
      return AppointmentStatus.PENDING;
  }
}

enum AppointmentStatus { PENDING, APPROVED, REJECTED }
