import 'dart:convert';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class DeactivateUserService {
  static Future deactivateUser(String id) async {
    print("Enter in deactivate User");
    print(id);
    // List<DeleteUserModel> updatedUserlist = [];

    // String url = "http://176.9.137.77:3001/user/delete/$id";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;

    // print("Enter in Delete User 2");

    String body = json.encode({
      'userId': id,
    });
    print(body);
    final response = await http.post(
      "http://176.9.137.77:3001/user/status/deactivate?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIwVDExOjMxOjUxLjEwNFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNjc4MzExLCJleHAiOjE2NzQyMTQzMTF9.-pRxZ-1HEL4ffMVcp55r-4xVh91T8On2GiBROrc7GlM",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    print(response);

    if (response.statusCode == 200) {
      //    var jsonList = jsonDecode(response.body)['data'];
      print("User Deactivated successfully");
      return DeactivateUserModel.fromJson(jsonDecode(response.body));

      // return jsonList;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("Error in User Deactivation");
      //  throw Exception('Failed to create album.');
    }
  }
}

// To parse this JSON data, do
//
//     final deactivateUserModel = deactivateUserModelFromJson(jsonString);

DeactivateUserModel deactivateUserModelFromJson(String str) =>
    DeactivateUserModel.fromJson(json.decode(str));

String deactivateUserModelToJson(DeactivateUserModel data) =>
    json.encode(data.toJson());

class DeactivateUserModel {
  DeactivateUserModel({
    this.message,
  });

  String message;

  factory DeactivateUserModel.fromJson(Map<String, dynamic> json) =>
      DeactivateUserModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
