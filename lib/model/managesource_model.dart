// To parse this JSON data, do
//
//     final manageSourceModel = manageSourceModelFromJson(jsonString);

import 'dart:convert';

List<ManageSourceModel> manageSourceModelFromJson(String str) =>
    List<ManageSourceModel>.from(
        json.decode(str).map((x) => ManageSourceModel.fromJson(x)));

String manageSourceModelToJson(List<ManageSourceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ManageSourceModel {
  ManageSourceModel({
    this.active,
    this.createdAt,
    this.email,
    this.id,
    this.imapServer,
    this.password,
    this.status,
    this.type,
    this.updatedAt,
    this.totalEmails,
    this.fetchedEmailCount,
    this.unfetchedEmailCount,
    this.fetchedMailFrom,
    this.fetchedMailTill,
    this.daysLeftToFetched,
    this.mailFetchStatus,
    this.lastMailFetchTime,
    this.smtpId,
    this.oAuthSource,
  });

  bool active;
  DateTime createdAt;
  String email;
  String id;
  String imapServer;
  String password;
  String status;
  String type;
  DateTime updatedAt;
  int totalEmails;
  int fetchedEmailCount;
  int unfetchedEmailCount;
  String fetchedMailFrom;
  String fetchedMailTill;
  int daysLeftToFetched;
  String mailFetchStatus;
  DateTime lastMailFetchTime;
  String smtpId;
  bool oAuthSource;

  factory ManageSourceModel.fromJson(Map<String, dynamic> json) =>
      ManageSourceModel(
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
        id: json["id"],
        imapServer: json["imap_server"],
        password: json["password"],
        status: json["status"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        totalEmails: json["total_emails"],
        fetchedEmailCount: json["fetched_email_count"],
        unfetchedEmailCount: json["unfetched_email_count"],
        fetchedMailFrom: json["fetched_mail_from"],
        fetchedMailTill: json["fetched_mail_till"],
        daysLeftToFetched: json["days_left_to_fetched"],
        mailFetchStatus: json["mailFetchStatus"],
        lastMailFetchTime: DateTime.parse(json["lastMailFetchTime"]),
        smtpId: json["smtp_id"],
        oAuthSource: json["oAuthSource"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "email": email,
        "id": id,
        "imap_server": imapServer,
        "password": password,
        "status": status,
        "type": type,
        "updatedAt": updatedAt.toIso8601String(),
        "total_emails": totalEmails,
        "fetched_email_count": fetchedEmailCount,
        "unfetched_email_count": unfetchedEmailCount,
        "fetched_mail_from": fetchedMailFrom,
        "fetched_mail_till": fetchedMailTill,
        "days_left_to_fetched": daysLeftToFetched,
        "mailFetchStatus": mailFetchStatus,
        "lastMailFetchTime": lastMailFetchTime.toIso8601String(),
        "smtp_id": smtpId,
        "oAuthSource": oAuthSource,
      };
}
