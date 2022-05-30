// To parse this JSON data, do
//
//     final profileUpdate = profileUpdateFromJson(jsonString);

import 'dart:convert';

ProfileUpdate profileUpdateFromJson(String str) =>
    ProfileUpdate.fromJson(json.decode(str));

String profileUpdateToJson(ProfileUpdate data) => json.encode(data.toJson());

class ProfileUpdate {
  ProfileUpdate({
    this.message,
    this.token,
  });

  String message;
  String token;

  factory ProfileUpdate.fromJson(Map<String, dynamic> json) => ProfileUpdate(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}
