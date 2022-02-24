// To parse this JSON data, do
//
//     final rejectReasonModel = rejectReasonModelFromJson(jsonString);

import 'dart:convert';

RejectReasonModel rejectReasonModelFromJson(String str) =>
    RejectReasonModel.fromJson(json.decode(str));

String rejectReasonModelToJson(RejectReasonModel data) =>
    json.encode(data.toJson());

class RejectReasonModel {
  RejectReasonModel({
    this.reason,
    this.id,
  });

  List<Reason> reason;
  String id;

  factory RejectReasonModel.fromJson(Map<String, dynamic> json) =>
      RejectReasonModel(
        reason:
            List<Reason>.from(json["Reason"].map((x) => Reason.fromJson(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Reason": List<dynamic>.from(reason.map((x) => x.toJson())),
        "_id": id,
      };
}

class Reason {
  Reason({
    this.id,
    this.reason,
  });

  String id;
  String reason;

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
        id: json["id"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
      };
}
