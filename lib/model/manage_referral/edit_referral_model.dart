// To parse this JSON data, do
//
//     final editReferralModel = editReferralModelFromJson(jsonString);

import 'dart:convert';

EditReferralModel editReferralModelFromJson(String str) =>
    EditReferralModel.fromJson(json.decode(str));

String editReferralModelToJson(EditReferralModel data) =>
    json.encode(data.toJson());

class EditReferralModel {
  EditReferralModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory EditReferralModel.fromJson(Map<String, dynamic> json) =>
      EditReferralModel(
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
