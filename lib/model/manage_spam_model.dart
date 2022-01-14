// To parse this JSON data, do
//
//     final manageSpamList = manageSpamListFromJson(jsonString);

import 'dart:convert';

List<SpamListModel> manageSpamListFromJson(String str) =>
    List<SpamListModel>.from(
        json.decode(str).map((x) => SpamListModel.fromJson(x)));

//String manageSpamListToJson(List<ManageSpamList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpamListModel {
  SpamListModel({
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.manageSpamListId,
  });

  String id;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String manageSpamListId;

  factory SpamListModel.fromJson(Map<String, dynamic> json) => SpamListModel(
        id: json["_id"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        manageSpamListId: json["id"],
      );

  // Map<String, dynamic> toJson() => {
  //     "_id": id,
  //     "email": email,
  //     "createdAt": createdAt.toIso8601String(),
  //     "updatedAt": updatedAt.toIso8601String(),
  //     "__v": v,
  //     "id": manageSpamListId,
  // };
}
