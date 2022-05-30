// To parse this JSON data, do
//
//     final setPermissionModel = setPermissionModelFromJson(jsonString);

import 'dart:convert';

SetPermissionModel setPermissionModelFromJson(String str) =>
    SetPermissionModel.fromJson(json.decode(str));

String setPermissionModelToJson(SetPermissionModel data) =>
    json.encode(data.toJson());

class SetPermissionModel {
  SetPermissionModel({
    this.data,
    this.message,
  });

  Data data;
  String message;

  factory SetPermissionModel.fromJson(Map<String, dynamic> json) =>
      SetPermissionModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.n,
    this.nModified,
    this.ok,
  });

  int n;
  int nModified;
  int ok;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        n: json["n"],
        nModified: json["nModified"],
        ok: json["ok"],
      );

  Map<String, dynamic> toJson() => {
        "n": n,
        "nModified": nModified,
        "ok": ok,
      };
}
