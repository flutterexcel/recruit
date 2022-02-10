import 'dart:convert';

import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

class AddUserListService {
  //**** add user  */
  static Future addUserList(String name, String email, String password,
      String cpassword, String phone, String userType) async {
    String url = "$appUrl/user/add_user";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
        'confirm_password': cpassword,
        'phoneNo': phone,
        'user_type': userType
      }),
    );

    if (response.statusCode == 200) {
      print("User Added Successfully");
      return AddSpamModel.fromJson(jsonDecode(response.body));
    } else {
      print("error in user adding");
      return AddSpamModel.fromJson(jsonDecode(response.body));
    }
  }
}
