import 'dart:convert';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class JobRoleUpdateService {
  static Future roleUpdate(String id, String userType) async {
    print("Enter in Role Update User");
    print(id);
    print(userType);

    String url = "http://176.9.137.77:3001/user/role/update/$id/$userType";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;

    final response = await http.put(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response);

    if (response.statusCode == 200) {
      print("Job Role Updated Successfully");
      return JobRoleUpdateModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error in Job Role Updation");
    }
  }
}

JobRoleUpdateModel jobRoleUpdateModelFromJson(String str) =>
    JobRoleUpdateModel.fromJson(json.decode(str));

String jobRoleUpdateModelToJson(JobRoleUpdateModel data) =>
    json.encode(data.toJson());

class JobRoleUpdateModel {
  JobRoleUpdateModel({
    this.success,
    this.data,
  });

  int success;
  Data data;

  factory JobRoleUpdateModel.fromJson(Map<String, dynamic> json) =>
      JobRoleUpdateModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.message,
  });

  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
