// To parse this JSON data, do
//
//     final getPipelineModel = getPipelineModelFromJson(jsonString);

import 'dart:convert';

List<GetPipelineModel> getPipelineModelFromJson(String str) =>
    List<GetPipelineModel>.from(
        json.decode(str).map((x) => GetPipelineModel.fromJson(x)));

String getPipelineModelToJson(List<GetPipelineModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPipelineModel {
  GetPipelineModel({
    this.assignToAllEmails,
    this.activeStatus,
    this.parentId,
    this.id,
    this.title,
    this.sequence,
    this.getPipelineModelDefault,
    this.getPipelineModelId,
    this.read,
    this.unread,
    this.count,
    this.roundDetails,
  });

  bool assignToAllEmails;
  bool activeStatus;
  String parentId;
  String id;
  String title;
  int sequence;
  bool getPipelineModelDefault;
  String getPipelineModelId;
  int read;
  int unread;
  int count;
  List<GetPipelineModel> roundDetails;

  factory GetPipelineModel.fromJson(Map<String, dynamic> json) =>
      GetPipelineModel(
        assignToAllEmails: json["assign_to_all_emails"],
        activeStatus: json["active_status"],
        parentId: json["parent_id"],
        id: json["_id"],
        title: json["title"],
        sequence: json["sequence"],
        getPipelineModelDefault: json["default"],
        getPipelineModelId: json["id"],
        read: json["read"],
        unread: json["unread"],
        count: json["count"],
        roundDetails: json["roundDetails"] == null
            ? null
            : List<GetPipelineModel>.from(
                json["roundDetails"].map((x) => GetPipelineModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "assign_to_all_emails": assignToAllEmails,
        "active_status": activeStatus,
        "parent_id": parentId,
        "_id": id,
        "title": title,
        "sequence": sequence,
        "default": getPipelineModelDefault,
        "id": getPipelineModelId,
        "read": read,
        "unread": unread,
        "count": count,
        "roundDetails": roundDetails == null
            ? null
            : List<dynamic>.from(roundDetails.map((x) => x.toJson())),
      };
}
