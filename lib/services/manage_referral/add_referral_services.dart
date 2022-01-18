import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_referral/add_referral_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class AddReferralService {
  static Future<AddReferralModel> addReferralEmail(String email) async {
    final response = await http.post(
      Uri.parse(
          'http://176.9.137.77:3001/referral-email?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZGZkY2UxMjY2YzE0MDAzYTFlNGIxNiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTE0VDA0OjU2OjQ3LjMyMFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyMTM2MjA3LCJleHAiOjE2NzM2NzIyMDd9.66wWGCXdo1MjqP3aRJ64S9t5T98zFYcijoRudl16YoM'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      print("Referral Added Successfully");
      return AddReferralModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }
}
