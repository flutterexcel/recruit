// To parse this JSON data, do
//
//     final userLog = userLogFromJson(jsonString);

import 'dart:convert';

UserLog userLogFromJson(String str) => UserLog.fromJson(json.decode(str));

String userLogToJson(UserLog data) => json.encode(data.toJson());

class UserLog {
  UserLog({
    this.status,
    this.totalCount,
    this.data,
  });

  int status;
  int totalCount;
  List<Datum> data;

  factory UserLog.fromJson(Map<String, dynamic> json) => UserLog(
        status: json["status"],
        totalCount: json["totalCount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalCount": totalCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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
  UserId userId;
  String logMsg;
  String entityId;
  EntityData entityData;
  String entity;
  DateTime createdAt;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: userIdValues.map[json["userId"]],
        logMsg: json["logMsg"],
        entityId: json["entityId"] == null ? null : json["entityId"],
        entityData: json["entityData"] == null
            ? null
            : EntityData.fromJson(json["entityData"]),
        entity: json["entity"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userIdValues.reverse[userId],
        "logMsg": logMsg,
        "entityId": entityId == null ? null : entityId,
        "entityData": entityData == null ? null : entityData.toJson(),
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
    this.jobProfileTitle,
    this.userId,
    this.username,
    this.title,
    this.subject,
    this.email,
    this.addUser,
    this.addUserMail,
  });

  UserId id;
  String name;
  LoginUserType loginUserType;
  String jobProfileTitle;
  String userId;
  String username;
  String title;
  String subject;
  String email;
  String addUser;
  String addUserMail;

  factory EntityData.fromJson(Map<String, dynamic> json) => EntityData(
        id: json["_id"] == null ? null : userIdValues.map[json["_id"]],
        name: json["name"] == null ? null : json["name"],
        loginUserType: json["loginUserType"] == null
            ? null
            : loginUserTypeValues.map[json["loginUserType"]],
        jobProfileTitle:
            json["jobProfileTitle"] == null ? null : json["jobProfileTitle"],
        userId: json["userId"] == null ? null : json["userId"],
        username: json["username"] == null ? null : json["username"],
        title: json["title"] == null ? null : json["title"],
        subject: json["subject"] == null ? null : json["subject"],
        email: json["email"] == null ? null : json["email"],
        addUser: json["addUser"] == null ? null : json["addUser"],
        addUserMail: json["addUserMail"] == null ? null : json["addUserMail"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : userIdValues.reverse[id],
        "name": name == null ? null : name,
        "loginUserType": loginUserType == null
            ? null
            : loginUserTypeValues.reverse[loginUserType],
        "jobProfileTitle": jobProfileTitle == null ? null : jobProfileTitle,
        "userId": userId == null ? null : userId,
        "username": username == null ? null : username,
        "title": title == null ? null : title,
        "subject": subject == null ? null : subject,
        "email": email == null ? null : email,
        "addUser": addUser == null ? null : addUser,
        "addUserMail": addUserMail == null ? null : addUserMail,
      };
}

enum UserId {
  THE_61_E92_EFDD593_EB003_A013_D46,
  THE_61_EA3_C24_D593_EB003_A017_F6_D,
  THE_61_E5_A2_BC266_C14003_A1_E9219,
  THE_61_EA7205_D593_EB003_A01_BE94,
  THE_61_EA6_F5_DD593_EB003_A01_BC37,
  THE_61_EA478_ED593_EB003_A018_B1_B,
  THE_61_E948_C7_D593_EB003_A0157_D2,
  THE_61_E94846_D593_EB003_A01552_A
}

final userIdValues = EnumValues({
  "61e5a2bc266c14003a1e9219": UserId.THE_61_E5_A2_BC266_C14003_A1_E9219,
  "61e92efdd593eb003a013d46": UserId.THE_61_E92_EFDD593_EB003_A013_D46,
  "61e94846d593eb003a01552a": UserId.THE_61_E94846_D593_EB003_A01552_A,
  "61e948c7d593eb003a0157d2": UserId.THE_61_E948_C7_D593_EB003_A0157_D2,
  "61ea3c24d593eb003a017f6d": UserId.THE_61_EA3_C24_D593_EB003_A017_F6_D,
  "61ea478ed593eb003a018b1b": UserId.THE_61_EA478_ED593_EB003_A018_B1_B,
  "61ea6f5dd593eb003a01bc37": UserId.THE_61_EA6_F5_DD593_EB003_A01_BC37,
  "61ea7205d593eb003a01be94": UserId.THE_61_EA7205_D593_EB003_A01_BE94
});

enum LoginUserType { ADMIN, INTERVIEWEE }

final loginUserTypeValues = EnumValues(
    {"Admin": LoginUserType.ADMIN, "Interviewee": LoginUserType.INTERVIEWEE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
