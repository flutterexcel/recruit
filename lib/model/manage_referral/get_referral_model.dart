// To parse this JSON data, do
//
//     final getReferral = getReferralFromJson(jsonString);

import 'dart:convert';

List<GetReferral> getReferralFromJson(String str) => List<GetReferral>.from(
    json.decode(str).map((x) => GetReferral.fromJson(x)));

String getReferralToJson(List<GetReferral> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReferral {
  GetReferral({
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory GetReferral.fromJson(Map<String, dynamic> json) => GetReferral(
        id: json["_id"],
        email: json["email"] == null ? "null" : json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email == null ? null : email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
