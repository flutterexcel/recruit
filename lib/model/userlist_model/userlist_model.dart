// To parse this JSON data, do
//
//     final userListsModel = userListsModelFromJson(jsonString);

import 'dart:convert';

List<UserListsModel> userListsModelFromJson(String str) =>
    List<UserListsModel>.from(
        json.decode(str).map((x) => UserListsModel.fromJson(x)));

String userListsModelToJson(List<UserListsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListsModel {
  UserListsModel({
    this.lastLogin,
    this.activeStatus,
    this.extensionLogin,
    this.id,
    this.email,
    this.userType,
    this.name,
    this.imageName,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.userSetting,
    this.phoneNo,
    this.signature,
    this.userListsModelId,
    this.imageUrl,
    this.jobProfiles,
  });

  DateTime lastLogin;
  bool activeStatus;
  bool extensionLogin;
  String id;
  String email;
  String userType;
  String name;
  String imageName;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  UserSetting userSetting;
  int phoneNo;
  String signature;
  String userListsModelId;
  String imageUrl;
  List<String> jobProfiles;

  factory UserListsModel.fromJson(Map<String, dynamic> json) => UserListsModel(
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        activeStatus: json["activeStatus"],
        extensionLogin: json["extensionLogin"],
        id: json["_id"],
        email: json["email"],
        userType: json["user_type"],
        name: json["name"],
        imageName: json["imageName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        userSetting: json["user_setting"] == null
            ? null
            : UserSetting.fromJson(json["user_setting"]),
        phoneNo: json["phoneNo"],
        signature: json["signature"] == null ? null : json["signature"],
        userListsModelId: json["id"],
        imageUrl: json["imageUrl"],
        jobProfiles: json["jobProfiles"] == null
            ? null
            : List<String>.from(json["jobProfiles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "last_login": lastLogin == null ? null : lastLogin.toIso8601String(),
        "activeStatus": activeStatus,
        "extensionLogin": extensionLogin,
        "_id": id,
        "email": email,
        "user_type": userType,
        "name": name,
        "imageName": imageName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "user_setting": userSetting == null ? null : userSetting.toJson(),
        "phoneNo": phoneNo,
        "signature": signature == null ? null : signature,
        "id": userListsModelId,
        "imageUrl": imageUrl,
        "jobProfiles": jobProfiles == null
            ? null
            : List<dynamic>.from(jobProfiles.map((x) => x)),
      };
}

class UserSetting {
  UserSetting({
    this.firstLogin,
  });

  bool firstLogin;

  factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
        firstLogin: json["firstLogin"],
      );

  Map<String, dynamic> toJson() => {
        "firstLogin": firstLogin,
      };
}
