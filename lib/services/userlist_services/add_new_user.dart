import 'dart:convert';

import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:http/http.dart' as http;

class AddUserListService {
  //**** add user  */
  static Future addUserList(String name, String email, String password,
      String cpassword, String phone, String userType) async {
    final response = await http.post(
      Uri.parse(
          'http://176.9.137.77:3001/user/add_user?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIyVDA1OjU2OjQ1LjAwNVoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyODMxMDA1LCJleHAiOjE2NzQzNjcwMDV9.0mC06kXoibWMBy4YXSAy_rTJPJkuPJ1abOH4uIW-vW0'),
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
      print("Success");
      return AddSpamModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      return AddSpamModel.fromJson(jsonDecode(response.body));
    }
  }
}
