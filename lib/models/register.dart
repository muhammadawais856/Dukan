// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  final bool? success;
  final String? message;
  final User? user;

  Register({
    this.success,
    this.message,
    this.user,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    success: json["success"],
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? shopName;
  final String? shopAddress;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  User({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.shopName,
    this.shopAddress,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    shopName: json["shopName"],
    shopAddress: json["shopAddress"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "shopName": shopName,
    "shopAddress": shopAddress,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
