import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Get_Spam_Email_Service {
  static Future<List<ManageSpamList>> getManageSpamEmail() async {
    List<ManageSpamList> spamlist = [];
    final response = await http.get(
      Uri.parse(
          'http://176.9.137.77:3001/spamList/get/1/100?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTExVDA2OjQ5OjAyLjc2OFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxODgzNzQyLCJleHAiOjE2NzM0MTk3NDJ9.hvaL8wBbSuEHKZSUBACgNl_Uw5IJ7VuJNU0nNyC4faQ'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        spamlist.add(ManageSpamList.fromJson(prod));
      }
      print("got successfully");
      return spamlist;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }
}
