import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_product_recruit/model/getjoblist_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetJobListService extends ChangeNotifier {
  List<GetJobListModel> joblist = [];
  // ignore: missing_return
  Future<List<GetJobListModel>> getJobList() async {
    String url = "http://176.9.137.77:3001/job-profile/list";

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
      print("200 got successfully");
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        joblist.add(GetJobListModel.fromJson(prod));
      }
      print("job List got successfully");
      notifyListeners();
      return joblist;
      //print("Success");
      // return ManageSpamList.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      // throw Exception('Failed to create album.');
    }
  }
}
