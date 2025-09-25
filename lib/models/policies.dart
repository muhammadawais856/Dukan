// To parse this JSON data, do
//
//     final policies = policiesFromJson(jsonString);

import 'dart:convert';

Policies policiesFromJson(String str) => Policies.fromJson(json.decode(str));

String policiesToJson(Policies data) => json.encode(data.toJson());

class Policies {
  final bool? success;
  final List<Policy>? policies;

  Policies({
    this.success,
    this.policies,
  });

  factory Policies.fromJson(Map<String, dynamic> json) => Policies(
    success: json["success"],
    policies: json["policies"] == null ? [] : List<Policy>.from(json["policies"]!.map((x) => Policy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "policies": policies == null ? [] : List<dynamic>.from(policies!.map((x) => x.toJson())),
  };
}

class Policy {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Policy({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Policy.fromJson(Map<String, dynamic> json) => Policy(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
