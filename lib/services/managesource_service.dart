import 'dart:convert';
import 'package:flutter_product_recruit/model/managesource_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetManageSourceService {
  List<ManageSourceModel> sourcelists = [];
  // ignore: missing_return
  Future<List<ManageSourceModel>> getSourcesList() async {
    // String url = "http://176.9.137.77:3001/job-profile/list";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;
    final response = await http.get(
      Uri.parse(
          "http://176.9.137.77:3001/imap/get?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAyLTAxVDA0OjM4OjU1LjUxNFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQzNjkwMzM1LCJleHAiOjE2NzUyMjYzMzV9.7ebgYx1wrJXCFj3fjrvJB-Ir1FYdFQeu2y9WI8EevFE"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("200 got successfully");
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        sourcelists.add(ManageSourceModel.fromJson(prod));
      }
      print("manage source List got successfully");
      return sourcelists;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      // throw Exception('Failed to create album.');
    }
  }
}
