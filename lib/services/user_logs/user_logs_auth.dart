import 'dart:convert';

import 'package:flutter_product_recruit/model/userLog/user_log.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart' as http;

class UserLogsAuth {
  final JsonDecoder _jsonDecoder = JsonDecoder();

  List<UserLog> userLog = [];
  
  Future<List<UserLog>> getUserLogList(String token) async {
    
    String url = await UrlConfig.userLogs(
            action: "userlogs", endPoints: "dashboard/userLogs/1/100")
        .forFirstEnvironment();
    Map<String, String> queryParams = {'accessToken': StorageUtil.getToken()};
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    var res = await http.get(apiUrl);
    var resData = _jsonDecoder.convert(res.body)['data'];
    for (int i = 0; i < resData.length; i++) {
      Map<String, dynamic> map = resData[i];
      userLog .add(UserLog.fromJson(map));
    }
    return userLog;
  }
}
