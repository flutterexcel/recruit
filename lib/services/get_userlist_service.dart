import 'dart:convert';
import 'package:flutter_product_recruit/model/userlist_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetUserList {
  static Future<List<UserLists>> getUserList() async {
    List<UserLists> spamlist = [];
    final response = await http.get(
      Uri.parse(
          'http://176.9.137.77:3001/user/list/1/100?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTEyVDA3OjM3OjM3LjE5OVoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxOTczMDU3LCJleHAiOjE2NzM1MDkwNTd9.Y5_NMwKTqHsGLvxYKdcb8mHpANWa7GiS3H99jZfwjTw'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("User  got successfully");
      var jsonList = jsonDecode(response.body)['data'];
      for (var prod in jsonList) {
        spamlist.add(UserLists.fromJson(prod));
      }
      print("User List got successfully");
      return spamlist;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }
}
