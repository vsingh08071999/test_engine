//class RegistrationModel {
//  final String userid;
//  final String password;
//  final String name;
//  final String address;
//  final String phone;
//  final String email;
//  final String role;
//  final String regcode;
//
//  RegistrationModel(
//      {this.userid,
//      this.password,
//      this.name,
//      this.address,
//      this.phone,
//      this.email,
//      this.role,
//      this.regcode});
//  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
//    return RegistrationModel(
//      userid: json['userid'],
//      password: json['password'],
//      name: json['name'],
//      address: json['address'],
//      phone: json['phone'],
//      email: json['email'],
//      role: json['role'],
//      regcode: json['regcode'],
//    );
//  }
//}
// To parse this JSON data, do
//
//     final registraionModel = registraionModelFromJson(jsonString);

import 'dart:convert';

RegistraionModel registraionModelFromJson(String str) =>
    RegistraionModel.fromJson(json.decode(str));

String registraionModelToJson(RegistraionModel data) =>
    json.encode(data.toJson());

class RegistraionModel {
  RegistraionModel({
    this.uid,
    this.userid,
    this.roleName,
    this.message,
    this.tokenId,
    this.rights,
    this.statuscode,
  });

  int uid;
  dynamic userid;
  dynamic roleName;
  String message;
  dynamic tokenId;
  dynamic rights;
  String statuscode;

  factory RegistraionModel.fromJson(Map<String, dynamic> json) =>
      RegistraionModel(
        uid: json["uid"],
        userid: json["userid"],
        roleName: json["roleName"],
        message: json["message"],
        tokenId: json["tokenId"],
        rights: json["rights"],
        statuscode: json["statuscode"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "userid": userid,
        "roleName": roleName,
        "message": message,
        "tokenId": tokenId,
        "rights": rights,
        "statuscode": statuscode,
      };
}
