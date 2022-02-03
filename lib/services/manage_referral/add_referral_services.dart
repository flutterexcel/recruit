import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_product_recruit/model/manage_referral/add_referral_model.dart';
import 'package:flutter_product_recruit/model/manage_referral/edit_referral_model.dart';
import 'package:flutter_product_recruit/model/manage_referral/get_referral_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class AddReferralService extends ChangeNotifier {
  // ignore: deprecated_member_use
  List<ReferralListModel> addedList = new List<ReferralListModel>();
  Future<AddReferralModel> addReferralEmail(String email) async {
    print("-----------------enter in function");
    String url = "http://176.9.137.77:3001/referral-email";

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
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      print("Referral Added Successfully");
      notifyListeners();
      var res = AddReferralModel.fromJson(jsonDecode(response.body));
      //print(res.data);
      // addedList.add(ReferralListModel());
      return res;
      //print(addedList);
    } else {
      print("------------------error");
      throw Exception('Failed to create referrals.');
    }
  }

  //**** edit referrals
  Future<EditReferralModel> editReferralEmail(String id, String email) async {
    print("-----------------enter in function");
    String url = "http://176.9.137.77:3001/referral-email/$id";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      print("Referral updated Successfully");
      notifyListeners();
      EditReferralModel res =
          EditReferralModel.fromJson(jsonDecode(response.body));
      //print(res.data);
      // addedList.add(ReferralListModel());
      return res;
      //print(addedList);
    } else {
      print("------------------error");
      throw Exception('Failed to update referrals ');
    }
  }
}
