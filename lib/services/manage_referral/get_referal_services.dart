import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_product_recruit/model/manage_referral/get_referral_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetReferralEmailService extends ChangeNotifier {
  List<ReferralListModel> referralList = [];
  // ignore: missing_return
  Future<List<ReferralListModel>> getReferralEmail() async {
    // String url = "http://176.9.137.77:3001/referral-email";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;

    var response = await http.get(
        'http://176.9.137.77:3001/referral-email?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZGZkY2UxMjY2YzE0MDAzYTFlNGIxNiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTE0VDA0OjU2OjQ3LjMyMFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyMTM2MjA3LCJleHAiOjE2NzM2NzIyMDd9.66wWGCXdo1MjqP3aRJ64S9t5T98zFYcijoRudl16YoM');
    try {
      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body)['data'];
        for (var prod in jsonList) {
          referralList.add(ReferralListModel.fromJson(prod));
          notifyListeners();
        }
        print("referral got successfully");

        return referralList;
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
// import 'dart:convert';
// import 'package:flutter_product_recruit/model/manage_referral/get_referral_model.dart';
// import 'package:http/http.dart' as http;

// // ignore: camel_case_types
// class GetReferralEmailService {
//   // ignore: missing_return
//   static Future<List<ReferralListModel>> getReferralEmail() async {
//     List<ReferralListModel> referralList = [];
//     // String url = "http://176.9.137.77:3001/referral-email";

//     // Map<String, String> queryParams = {
//     //   'accessToken': StorageUtil.getToken(),
//     // };

//     // String queryString = Uri(queryParameters: queryParams).query;

//     // String apiUrl = url + '?' + queryString;

//     var response = await http.get(
//         'http://176.9.137.77:3001/referral-email?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZGZkY2UxMjY2YzE0MDAzYTFlNGIxNiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTE0VDA0OjU2OjQ3LjMyMFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyMTM2MjA3LCJleHAiOjE2NzM2NzIyMDd9.66wWGCXdo1MjqP3aRJ64S9t5T98zFYcijoRudl16YoM');
//     try {
//       if (response.statusCode == 200) {
//         var jsonList = jsonDecode(response.body)['data'];
//         for (var prod in jsonList) {
//           referralList.add(ReferralListModel.fromJson(prod));
//         }
//         print("referral got successfully");
//         return referralList;
//         //print("Success");
//         // return ManageSpamList.fromJson(jsonDecode(response.body));
//       } else {
//         print("error in referral");
//         throw Exception('Failed to create album.');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

