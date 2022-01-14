// To parse this JSON data, do
//
//     final getReferral = getReferralFromJson(jsonString);

import 'dart:convert';

List<ReferralListModel> getReferralFromJson(String str) =>
    List<ReferralListModel>.from(
        json.decode(str).map((x) => ReferralListModel.fromJson(x)));

String getReferralToJson(List<ReferralListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReferralListModel {
  ReferralListModel({
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

  factory ReferralListModel.fromJson(Map<String, dynamic> json) =>
      ReferralListModel(
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
