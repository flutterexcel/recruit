// To parse this JSON data, do
//
//     final permissionModel = permissionModelFromJson(jsonString);

import 'dart:convert';

PermissionModel permissionModelFromJson(String str) =>
    PermissionModel.fromJson(json.decode(str));

String permissionModelToJson(PermissionModel data) =>
    json.encode(data.toJson());

class PermissionModel {
  PermissionModel({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.configurations,
    this.id,
    this.configHeading,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<Configuration> configurations;
  String id;
  String configHeading;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        configurations: List<Configuration>.from(
            json["configurations"].map((x) => Configuration.fromJson(x))),
        id: json["_id"],
        configHeading: json["configHeading"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "configurations":
            List<dynamic>.from(configurations.map((x) => x.toJson())),
        "_id": id,
        "configHeading": configHeading,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Configuration {
  Configuration({
    this.title,
    this.accessCode,
    this.isChecked,
  });

  String title;
  String accessCode;
  bool isChecked;

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        title: json["title"],
        accessCode: json["accessCode"],
        isChecked: json["isChecked"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "accessCode": accessCode,
        "isChecked": isChecked,
      };
}
