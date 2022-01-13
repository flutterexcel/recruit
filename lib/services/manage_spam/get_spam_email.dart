import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetEmailSpamService {
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
}
