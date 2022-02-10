import 'dart:convert';
import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ManageSpamService {
// ***** get spam List
  static Future<List<ManageSpamList>> getManageSpamEmail() async {
    List<ManageSpamList> spamlist = [];
    String url = "$appUrl/spamList/get/1/100";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    var response = await http.get(apiUrl);
    print("response$response");

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        spamlist.add(ManageSpamList.fromJson(prod));
      }
      print("spam got successfully");
      return spamlist;
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }

  //*****  add spam list

  static Future addManageSpamEmail(String email) async {
    String url = "http://176.9.137.77:3001/spamData/add";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    final response = await http.post(
      apiUrl,
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

  // ignore: non_constant_identifier_names
  static Future DeleteSpamService(String id) async {
    String url = "http://176.9.137.77:3001/spamList/delete/$id";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    final res = await http.delete(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (res.statusCode == 200) {
      print("Successfully Deleted");
      return DeleteSpamModel.fromJson(jsonDecode(res.body));
    } else {
      print("error in deletion");
      return AddSpamModel.fromJson(jsonDecode(res.body));
    }
  }
}
