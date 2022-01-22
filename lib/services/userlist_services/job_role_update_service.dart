import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class JobRoleUpdateService {
  static Future roleUpdate(String id, String userType) async {
    print("Enter in Role Update User");
    print(id);
    print(userType);
    // List<DeleteUserModel> updatedUserlist = [];

    // String url = "http://176.9.137.77:3001/user/delete/$id";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;

    // print("Enter in Delete User 2");

    final response = await http.put(
      "http://176.9.137.77:3001/user/role/update/$id/$userType?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIxVDA2OjAzOjA4LjY4MloiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNzQ0OTg4LCJleHAiOjE2NzQyODA5ODh9.8pEh7K2DgwPny3aDSKrTxf8-lYcYP1K5ykj3hQ6ywc0",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response);

    if (response.statusCode == 200) {
      //    var jsonList = jsonDecode(response.body)['data'];
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
