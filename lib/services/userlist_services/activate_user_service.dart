import 'dart:convert';

import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/deactivate_user_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ActivateUserService {
  static Future activateUser(String id) async {
    print("Enter in Activate User");
    print(id);

    String url = "http://176.9.137.77:3001/user/status/activate";

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
      print("User Activated successfully");
      return DeactivateUserModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error in User Activation");
    }
  }
}
