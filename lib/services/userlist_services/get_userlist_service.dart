import 'dart:convert';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetUserListService {
  static Future<List<UserListsModel>> getUserList() async {
    List<UserListsModel> userslist = [];

    // String url = "http://176.9.137.77:3001/user/list/1/100";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;
    final response = await http.get(
      Uri.parse(
          "http://176.9.137.77:3001/user/list/1/100?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIxVDA0OjQxOjAyLjU5MFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNzQwMDYyLCJleHAiOjE2NzQyNzYwNjJ9.hosTct9shtJtIKWNIbbnLZrckMnclGfidvkQ6tIhs3k"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body)['data'];
      for (var prod in jsonList) {
        userslist.add(UserListsModel.fromJson(prod));
      }
      print("User List got successfully");
      return userslist;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }
}
