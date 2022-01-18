import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_referral/add_referral_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class AddReferralService {
  static Future<AddReferralModel> addReferralEmail(String email) async {
    final response = await http.post(
      Uri.parse(
          'http://176.9.137.77:3001/referral-email?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTEyVDA1OjAyOjMzLjAxM1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxOTYzNzUzLCJleHAiOjE2NzM0OTk3NTN9.YnumF9QcCdxJCoyQxp5WRSKflqCd0h7UH3gbQmRFdlw'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      print("Success");
      return AddReferralModel.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }
}
