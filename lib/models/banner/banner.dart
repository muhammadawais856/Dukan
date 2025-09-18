// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

Banner bannerFromJson(String str) => Banner.fromJson(json.decode(str));

String bannerToJson(Banner data) => json.encode(data.toJson());

class Banner {
  final bool? success;
  final int? count;
  final Banners? banners;

  Banner({
    this.success,
    this.count,
    this.banners,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    success: json["success"],
    count: json["count"],
    banners: json["banners"] == null ? null : Banners.fromJson(json["banners"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "banners": banners?.toJson(),
  };
}

class Banners {
  final String? id;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Banners({
    this.id,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["_id"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
