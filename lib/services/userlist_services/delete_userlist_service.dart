import 'dart:convert';
import 'package:flutter_product_recruit/model/userlist_model/delete_userlist_model.dart';

import 'package:http/http.dart' as http;

// ignore: camel_case_types
class DeleteUserService {
  static Future deleteUser(String id) async {
    print("Enter in Delete User");
    print(id);
    // List<DeleteUserModel> updatedUserlist = [];

    // String url = "http://176.9.137.77:3001/user/delete/$id";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;

    // print("Enter in Delete User 2");

    final response = await http.delete(
      "http://176.9.137.77:3001/user/delete/$id?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIwVDA5OjUxOjA4LjA3MVoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNjcyMjY4LCJleHAiOjE2NzQyMDgyNjh9.ZTBpETBu_uuKCAIzU5JOqMUgY02ax_SFk14AExCH7nQ",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response);

    if (response.statusCode == 200) {
      //    var jsonList = jsonDecode(response.body)['data'];
      print("User Deleted successfully");
      return DeleteUserModel.fromJson(jsonDecode(response.body));

      // return jsonList;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error in");
      //  throw Exception('Failed to create album.');
    }
  }
}
