// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/permission/permisson.dart';
import 'package:flutter_product_recruit/model/permission/set_permission_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

class PermissionService {
  static Future<PermissionModel> GetPermission() async {
    //** dynamic url */
    String url = "$appUrl/permission";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    //**static url */
    // String apiUrl =
    //     'http://176.9.137.77:3001/permission?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIwVDEwOjIyOjI5LjUzN1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNjc0MTQ5LCJleHAiOjE2NzQyMTAxNDl9.SvVXtX5eiNCkW73joIt2c0znNIyIZDAH8DsNF4tH-Oc';

    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print("Success");
      // print(jsonDecode(response.body)['data']);
      return PermissionModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      return PermissionModel.fromJson(jsonDecode(response.body));
    }
  }

  static Future setPermission(String accessCode, String configHeading) async {
    Map data = {
      'accessCode': accessCode,
      'configHeading': configHeading,
    };
    print(json.encode(data));
    final response = await http.put(
      Uri.parse(
          'http://176.9.137.77:3001/permission/set?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIwVDEwOjIyOjI5LjUzN1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNjc0MTQ5LCJleHAiOjE2NzQyMTAxNDl9.SvVXtX5eiNCkW73joIt2c0znNIyIZDAH8DsNF4tH-Oc'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print("setPermission success");
      return SetPermissionModel.fromJson(jsonDecode(response.body));
    } else {
      print("setPermission error");
      return SetPermissionModel.fromJson(jsonDecode(response.body));
    }
  }

  //*** remove permission  */

  static Future removePermission(String accessCode, String config) async {
    final response = await http.put(
      Uri.parse(
          'http://176.9.137.77:3001/permission/remove?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIwVDEwOjIyOjI5LjUzN1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNjc0MTQ5LCJleHAiOjE2NzQyMTAxNDl9.SvVXtX5eiNCkW73joIt2c0znNIyIZDAH8DsNF4tH-Oc'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'accessCode': accessCode,
        'configHeading': config,
      }),
    );

    if (response.statusCode == 200) {
      print("Success remove permission");
      return SetPermissionModel.fromJson(jsonDecode(response.body));
    } else {
      print("error remove permission");
      return SetPermissionModel.fromJson(jsonDecode(response.body));
    }
  }

  //remove permission

//   PostService postService = new PostService();
//   Future removeP(String accessCode, String config) async {
//     var apiUrl =
//         'http://176.9.137.77:3001/permission/remove?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIwVDEwOjIyOjI5LjUzN1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyNjc0MTQ5LCJleHAiOjE2NzQyMTAxNDl9.SvVXtX5eiNCkW73joIt2c0znNIyIZDAH8DsNF4tH-Oc';
//     Map data = {
//       'accessCode': accessCode,
//       'configHeading': config,
//     };
//     return postService.post(apiUrl, body: data).then((value) {
//       return value;
//     });
//   }
}
