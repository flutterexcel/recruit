import 'dart:convert';
import 'package:flutter_product_recruit/model/jobperformance_model.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetJobPerformanceService {
  List jobPerLists = [];
  // ignore: missing_return
  Future<List<JobPerformanceModel>> getJobPerformanceList(String id) async {
    // String url = "http://176.9.137.77:3001/job-profile/list";

    // Map<String, String> queryParams = {
    //   'accessToken': StorageUtil.getToken(),
    // };s

    // String queryString = Uri(queryParameters: queryParams).query;

    // String apiUrl = url + '?' + queryString;
    String body = json.encode({
      'userId': id,
    });
    final response = await http.post(
      Uri.parse(
          "http://176.9.137.77:3001/user/jobPerformanceData?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAyLTAxVDA5OjMzOjI1LjMwNloiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQzNzA4MDA1LCJleHAiOjE2NzUyNDQwMDV9.3t0Q50O7zJJv79iHWYXTk0__Zs0ytbb23OpRKxPdEGw"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print("200 job performance got successfully");

      List jsonList = jsonDecode(response.body);
      // for (var prod in jsonList) {
      //   jobPerLists.add(JobPerformanceModel.fromJson(prod));
      // }

      for (var i = 0; i <= jsonList.length; i++) {
        print(jsonList[i]);
        jobPerLists.add(jsonList[i]);
      }
      print("job performanceList got successfully");
      return jobPerLists;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error in job performance");
      // throw Exception('Failed to create album.');
    }
  }
}
