import 'dart:convert';

import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class DeactivateUserService {
  static Future deactivateUser(String id) async {
    print("Enter in deactivate User");
    print(id);

    String url = "$appUrl/user/status/deactivate";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;

    // print("Enter in Delete User 2");

    String body = json.encode({
      'userId': id,
    });
    print(body);
    final response = await http.post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    print(response);

    if (response.statusCode == 200) {
      print("User Deactivated successfully");
      return DeactivateUserModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error in User Deactivation");
    }
  }
}

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
