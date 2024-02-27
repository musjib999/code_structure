import 'dart:convert';

class AppUser {
  final String id;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic email;
  final dynamic phone;
  final dynamic password;
  final dynamic userRole;
  final DateTime updatedAt;
  final DateTime createdAt;
  final dynamic subId;
  final dynamic profilePicture;
  final dynamic dateOfBirth;
  final dynamic gender;
  final bool isEmailVerified;

  AppUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.userRole,
    required this.updatedAt,
    required this.createdAt,
    required this.subId,
    required this.profilePicture,
    required this.dateOfBirth,
    required this.gender,
    required this.isEmailVerified,
  });

  factory AppUser.fromRawJson(String str) => AppUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
      password: json["password"],
      userRole: json["userRole"],
      updatedAt: DateTime.parse(json["updatedAt"]),
      createdAt: DateTime.parse(json["createdAt"]),
      subId: json["subId"],
      profilePicture: json["profilePicture"],
      dateOfBirth: json["dateOfBirth"],
      gender: json["gender"],
      isEmailVerified: json["isEmailVerified"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "userRole": userRole,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "subId": subId,
        "profilePicture": profilePicture,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "isEmailVerified": isEmailVerified,
      };
}
