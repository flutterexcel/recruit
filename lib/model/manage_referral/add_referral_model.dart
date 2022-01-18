// To parse this JSON data, do
//
//     final createReferral = createReferralFromJson(jsonString);

import 'dart:convert';

AddReferralModel createReferralFromJson(String str) =>
    AddReferralModel.fromJson(json.decode(str));

String createReferralToJson(AddReferralModel data) =>
    json.encode(data.toJson());

class AddReferralModel {
  AddReferralModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory AddReferralModel.fromJson(Map<String, dynamic> json) =>
      AddReferralModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
