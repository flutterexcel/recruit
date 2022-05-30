import 'dart:convert';
import 'package:flutter_product_recruit/model/userlist_model/delete_userlist_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class DeleteUserService {
  static Future deleteUser(String id) async {
    print("Enter in Delete User");
    print(id);

    String url = "http://176.9.137.77:3001/user/delete/$id";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;

    final response = await http.delete(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response);

    if (response.statusCode == 200) {
      print("User Deleted successfully");
      return DeleteUserModel.fromJson(jsonDecode(response.body));
    } else {
      print("error in user deletion");
    }
  }
}
