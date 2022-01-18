import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ManageSpamService {
// ***** get spam List
  static Future<List<ManageSpamList>> getManageSpamEmail() async {
    List<ManageSpamList> spamlist = [];
    String url = "http://176.9.137.77:3001/spamList/get/1/100";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    var response = await http.get(apiUrl);
    print("response${response}");

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

  //*****  add spam list

  static Future addManageSpamEmail(String email) async {
    final response = await http.post(
      Uri.parse(
          'http://176.9.137.77:3001/spamData/add?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTAyNDg2MjY2YzE0MDAzYTFlNGVmYSIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTE0VDA1OjExOjI0LjgyOFoiLCJwYXNzd29yZCI6Im40YlFnWWhNZldXYUwrcWd4VnJRRmFPL1R4c3JDNElzMFYxc0ZiRHdDZ2c9IiwiaWF0IjoxNjQyMTM3MDg0LCJleHAiOjE2NzM2NzMwODR9.tD6NTGTF4TDzuX2tg3M92W6tLpMDkFtP40zpti1DXJw'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      print("Success");
      return AddSpamModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      return AddSpamModel.fromJson(jsonDecode(response.body));
    }
  }
}
