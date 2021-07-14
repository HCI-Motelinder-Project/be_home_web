//@dart=2.9
class UserModel {
  String id;
  String email;
  String phone;
  String name;
  DateTime dateOfBirth;
  String status;
  String image;
  Role role;
  String roleId;

  UserModel({
    this.id,
    this.email,
    this.phone,
    this.name,
    this.dateOfBirth,
    this.status,
    this.image,
    this.role,
    this.roleId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['account']['userId'],
        email: json['account']['email'],
        phone: json['account']['phone'],
        name: json['account']['fullname'],
        dateOfBirth: DateTime.parse(json['account']['dateOfBirth']),
        status: json['account']['status'],
        image: json['account']['image'],
        roleId: json['account']['roleId'],
        role: getRoleFromJsonCode(json['account']['roleName']));
  }

  factory UserModel.fromResponseJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['account']['userId'],
        email: json['account']['email'],
        phone: json['account']['phone'],
        name: json['account']['fullname'],
        dateOfBirth: DateTime.parse(json['account']['dateOfBirth']),
        status: json['account']['status'],
        image: json['account']['image'],
        roleId: json['account']['roleId'],
        role: getRoleFromJsonCode(json['account']['roleName']));
  }
}

enum Role { ADMIN, RENTER, OWNER }

Role getRoleFromJsonCode(role) {
  switch (role) {
    case "Owner":
      return Role.OWNER;
    case "Admin":
      return Role.ADMIN;
    default:
      return Role.RENTER;
  }
}
