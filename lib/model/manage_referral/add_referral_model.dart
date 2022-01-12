// To parse this JSON data, do
//
//     final createReferral = createReferralFromJson(jsonString);

import 'dart:convert';

CreateReferral createReferralFromJson(String str) =>
    CreateReferral.fromJson(json.decode(str));

String createReferralToJson(CreateReferral data) => json.encode(data.toJson());

class CreateReferral {
  CreateReferral({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CreateReferral.fromJson(Map<String, dynamic> json) => CreateReferral(
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
