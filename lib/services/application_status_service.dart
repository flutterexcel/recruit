import 'dart:convert';
import 'package:flutter_product_recruit/model/job_candidate_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetApplicationStatusService {
  List<Datum> applicationStatus = [];
  // ignore: missing_return
  Future<List<Datum>> getApplicationStatus() async {
    print("entered");
    // String url = "http://176.9.137.77:3001/job-profile/list";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;
    final response = await http.get(
      Uri.parse(
          "http://176.9.137.77:3001/statistics/all-application-stats?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTIyVDA3OjU2OjM1LjQxNFoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQyODM4MTk1LCJleHAiOjE2NzQzNzQxOTV9.8F1hfQeCsdXTbOXOkpk7YbSKbB6EgijnHrs8loWrF9E"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("200 app got successfully");
      var jsonList = jsonDecode(response.body)['data'];
      for (var prod in jsonList) {
        applicationStatus.add(Datum.fromJson(prod));
      }
      print("Application Status got successfully");
      return applicationStatus;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error in Application Status");
    }
  }
}
