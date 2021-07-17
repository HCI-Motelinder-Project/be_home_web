class FacilityModel {
  String id;
  String name;
  String icon;
  String status;

  FacilityModel({this.id, this.name, this.icon, this.status});

  factory FacilityModel.fromJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json["facilityId"],
      name: json["name"],
      icon: json["icon"],
      status: json["status"],
    );
  }

  factory FacilityModel.fromResponseJson(Map<String, dynamic> json) {
    return FacilityModel(
      id: json["facilityId"],
      name: json["name"],
      icon: json["icon"],
      status: json["status"],
    );
  }
}