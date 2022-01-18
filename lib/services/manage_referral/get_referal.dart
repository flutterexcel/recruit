import 'dart:convert';
import 'package:flutter_product_recruit/model/manage_referral/get_referral_model.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Get_Referral_Email_Service {
  // ignore: missing_return
  static Future<List<ReferralListModel>> getReferralEmail() async {
    List<ReferralListModel> spamlist = [];
    final response = await http.get(
      Uri.parse(
          'http://176.9.137.77:3001/referral-email?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTEyVDA1OjAyOjMzLjAxM1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxOTYzNzUzLCJleHAiOjE2NzM0OTk3NTN9.YnumF9QcCdxJCoyQxp5WRSKflqCd0h7UH3gbQmRFdlw'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    try {
      if (response.statusCode == 200) {
        //  var resData = _jsonDecoder.convert(res.body)['data'];
        //print("referral got successfully");
        var jsonList = jsonDecode(response.body)['data'];
        for (var prod in jsonList) {
          spamlist.add(ReferralListModel.fromJson(prod));
        }
        print("referral got successfully");
        return spamlist;
        //print("Success");
        // return ManageSpamList.fromJson(jsonDecode(response.body));
      } else {
        print("error in referral");
        throw Exception('Failed to create album.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
