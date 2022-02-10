import 'dart:convert';
import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/job_candidate_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetApplicationStatusService {
  List<Datum> applicationStatus = [];
  // ignore: missing_return
  Future<List<Datum>> getApplicationStatus() async {
    String url = "$appUrl/statistics/all-application-stats";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body)['data'];
      for (var prod in jsonList) {
        applicationStatus.add(Datum.fromJson(prod));
      }
      print("Application Status got successfully");
      return applicationStatus;
    } else {
      print("error in Application Status");
    }
  }
}
