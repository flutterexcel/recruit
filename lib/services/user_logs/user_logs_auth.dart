// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter_product_recruit/model/userLog/user_log.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart' as http;

class UserLogsAuth {
  final JsonDecoder _jsonDecoder = JsonDecoder();
  List<UserLog> userLog = [];
  static Future<UserLog> getUserLogList(String token) async {
    print("getUserLogList");
    String url = await UrlConfig.userLogs(
            action: "userlogs", endPoints: "dashboard/userLogs/1/100")
        .forFirstEnvironment();
    Map<String, String> queryParams = {'accessToken': StorageUtil.getToken()};
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    var res = await http.get(apiUrl);
    if (res.statusCode == 200) {
      print("Success userlog");
      // print(jsonDecode(response.body)['data']);
      return UserLog.fromJson(jsonDecode(res.body));
    } else {
      print("error userLog");
      return UserLog.fromJson(jsonDecode(res.body));
    }
  }
}
