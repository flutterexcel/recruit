// ignore_for_file: missing_return

import 'dart:convert';
import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetUserListService {
  static Future<List<UserListsModel>> getUserList() async {
    List<UserListsModel> userslist = [];

    print("appUrl--->$appUrl");

    String url = "$appUrl/user/list/1/100";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    print("queryString---->$queryString");

    String apiUrl = url + '?' + queryString;
    final response = await http.get(
      apiUrl,
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
    } else {
      print("Error in getting user");
    }
  }
}
