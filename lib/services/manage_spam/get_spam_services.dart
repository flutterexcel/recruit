import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetEmailSpamService {
  static Future<List<SpamListModel>> getSpamEmail() async {
    List<SpamListModel> spamlist = [];
    // String url = "http://176.9.137.77:3001/spamList/get/1/100";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;
    // String apiUrl = url + '?' + queryString;

    var response = await http.get(
        'http://176.9.137.77:3001/spamList/get/1/100?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZGZkY2UxMjY2YzE0MDAzYTFlNGIxNiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTE0VDA0OjU2OjQ3LjMyMFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyMTM2MjA3LCJleHAiOjE2NzM2NzIyMDd9.66wWGCXdo1MjqP3aRJ64S9t5T98zFYcijoRudl16YoM');
    print("response${response}");

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        spamlist.add(SpamListModel.fromJson(prod));
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
