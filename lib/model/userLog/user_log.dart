// To parse this JSON data, do
//
//     final userLog = userLogFromJson(jsonString);

import 'dart:convert';

UserLog userLogFromJson(String str) => UserLog.fromJson(json.decode(str));

String userLogToJson(UserLog data) => json.encode(data.toJson());

class UserLog {
  UserLog({
    this.id,
    this.userId,
    this.logMsg,
    this.entityId,
    this.entityData,
    this.entity,
    this.createdAt,
    this.v,
  });

  String id;
  String userId;
  String logMsg;
  String entityId;
  EntityData entityData;
  String entity;
  DateTime createdAt;
  int v;

  factory UserLog.fromJson(Map<String, dynamic> json) => UserLog(
        id: json["_id"],
        userId: json["userId"],
        logMsg: json["logMsg"],
        entityId: json["entityId"],
        entityData: EntityData.fromJson(json["entityData"]),
        entity: json["entity"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "logMsg": logMsg,
        "entityId": entityId,
        "entityData": entityData.toJson(),
        "entity": entity,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}

class EntityData {
  EntityData({
    this.id,
    this.name,
    this.loginUserType,
  });

  String id;
  String name;
  String loginUserType;

  factory EntityData.fromJson(Map<String, dynamic> json) => EntityData(
        id: json["_id"],
        name: json["name"],
        loginUserType: json["loginUserType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "loginUserType": loginUserType,
      };
}
