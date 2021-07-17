class ServiceModel {
  String id;
  String name;
  String icon;
  String status;

  ServiceModel({this.id, this.name, this.icon, this.status});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json["serviceId"],
      name: json["name"],
      icon: json["icon"],
      status: json["status"],
    );
  }

  factory ServiceModel.fromResponseJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json["serviceId"],
      name: json["name"],
      icon: json["icon"],
      status: json["status"],
    );
  }
}