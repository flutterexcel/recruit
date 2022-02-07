import 'dart:convert';

import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class DeactivateJobService {
  static Future deactivateJob(
      String fromDate, String id, bool status, String currentDate) async {
    print("Enter in deactivate Job");
    print(id);

    String url = "https://excellence_api.exweb.in/job-profile/job/close";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;

    // print("Enter in Delete User 2");

    String body = json.encode({
      'fromDate': fromDate,
      'id': id,
      'status': status,
      'toDate': currentDate
    });
    print(body);
    final response = await http.put(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    print(response);

    if (response.statusCode == 200) {
      print("Job Deactivated successfully");
      return JobDeactivationModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error in Job Deactivation");
    }
  }
}

// To parse this JSON data, do
//
//     final jobDeactivationModel = jobDeactivationModelFromJson(jsonString);

JobDeactivationModel jobDeactivationModelFromJson(String str) =>
    JobDeactivationModel.fromJson(json.decode(str));

String jobDeactivationModelToJson(JobDeactivationModel data) =>
    json.encode(data.toJson());

class JobDeactivationModel {
  JobDeactivationModel({
    this.status,
    this.data,
  });

  int status;
  Data data;

  factory JobDeactivationModel.fromJson(Map<String, dynamic> json) =>
      JobDeactivationModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.n,
    this.nModified,
    this.ok,
  });

  int n;
  int nModified;
  int ok;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        n: json["n"],
        nModified: json["nModified"],
        ok: json["ok"],
      );

  Map<String, dynamic> toJson() => {
        "n": n,
        "nModified": nModified,
        "ok": ok,
      };
}
