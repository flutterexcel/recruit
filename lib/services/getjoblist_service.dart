import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/getjoblist_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetJobListService extends ChangeNotifier {
  List<GetJobListModel> joblist = [];
  // ignore: missing_return
  Future<List<GetJobListModel>> getJobList() async {
    String url = "$appUrl/job-profile/list";

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
      var jsonList = jsonDecode(response.body);
      for (var prod in jsonList) {
        joblist.add(GetJobListModel.fromJson(prod));
      }
      print("job List got successfully");
      notifyListeners();
      return joblist;
    } else {
      print("error in getting joblists");
    }
  }
}
