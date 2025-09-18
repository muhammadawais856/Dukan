// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  final bool? success;
  final String? message;
  final User? user;
  final String? token;

  Login({
    this.success,
    this.message,
    this.user,
    this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    success: json["success"],
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? shopName;
  final String? shopAddress;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.shopName,
    this.shopAddress,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    shopName: json["shopName"],
    shopAddress: json["shopAddress"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "shopName": shopName,
    "shopAddress": shopAddress,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
