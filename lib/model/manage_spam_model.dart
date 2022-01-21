// To parse this JSON data, do
//
//     final manageSpamList = manageSpamListFromJson(jsonString);

import 'dart:convert';

List<ManageSpamList> manageSpamListFromJson(String str) =>
    List<ManageSpamList>.from(
        json.decode(str).map((x) => ManageSpamList.fromJson(x)));

//String manageSpamListToJson(List<ManageSpamList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManageSpamList {
  ManageSpamList({
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

  factory ManageSpamList.fromJson(Map<String, dynamic> json) => ManageSpamList(
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

//**** add spam model ****//

// To parse this JSON data, do
//
//     final addSpamModel = addSpamModelFromJson(jsonString);

AddSpamModel addSpamModelFromJson(String str) =>
    AddSpamModel.fromJson(json.decode(str));

String addSpamModelToJson(AddSpamModel data) => json.encode(data.toJson());

class AddSpamModel {
  AddSpamModel({
    this.error,
    this.message,
  });

  int error;
  String message;

  factory AddSpamModel.fromJson(Map<String, dynamic> json) => AddSpamModel(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}

//***** delete spam model */
DeleteSpamModel deleteSpamModelFromJson(String str) =>
    DeleteSpamModel.fromJson(json.decode(str));

String deleteSpamModelToJson(DeleteSpamModel data) =>
    json.encode(data.toJson());

class DeleteSpamModel {
  DeleteSpamModel({
    this.status,
  });

  String status;

  factory DeleteSpamModel.fromJson(Map<String, dynamic> json) =>
      DeleteSpamModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
