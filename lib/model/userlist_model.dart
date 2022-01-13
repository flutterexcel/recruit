// To parse this JSON data, do
//
//     final userList = userListFromJson(jsonString);

import 'dart:convert';

List<UserLists> userListFromJson(String str) =>
    List<UserLists>.from(json.decode(str).map((x) => UserLists.fromJson(x)));

String userListToJson(List<UserLists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLists {
  UserLists({
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
    this.userListId,
    this.imageUrl,
    this.jobProfiles,
  });

  DateTime lastLogin;
  bool activeStatus;
  bool extensionLogin;
  String id;
  String email;
  UserType userType;
  String name;
  String imageName;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  UserSetting userSetting;
  int phoneNo;
  String signature;
  String userListId;
  String imageUrl;
  List<String> jobProfiles;

  factory UserLists.fromJson(Map<String, dynamic> json) => UserLists(
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        activeStatus: json["activeStatus"],
        extensionLogin: json["extensionLogin"],
        id: json["_id"],
        email: json["email"],
        userType: userTypeValues.map[json["user_type"]],
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
        userListId: json["id"],
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
        "user_type": userTypeValues.reverse[userType],
        "name": name,
        "imageName": imageName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "user_setting": userSetting == null ? null : userSetting.toJson(),
        "phoneNo": phoneNo,
        "signature": signature == null ? null : signature,
        "id": userListId,
        "imageUrl": imageUrl,
        "jobProfiles": jobProfiles == null
            ? null
            : List<dynamic>.from(jobProfiles.map((x) => x)),
      };
}

class UserSetting {
  UserSetting({
    this.firstLogin,
    this.dtAgain,
  });

  bool firstLogin;
  bool dtAgain;

  factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
        firstLogin: json["firstLogin"],
        dtAgain: json["dtAgain"] == null ? null : json["dtAgain"],
      );

  Map<String, dynamic> toJson() => {
        "firstLogin": firstLogin,
        "dtAgain": dtAgain == null ? null : dtAgain,
      };
}

enum UserType { ADMIN, HR, INTERVIEWEE }

final userTypeValues = EnumValues({
  "Admin": UserType.ADMIN,
  "HR": UserType.HR,
  "Interviewee": UserType.INTERVIEWEE
});

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
