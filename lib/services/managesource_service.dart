import 'dart:convert';
import 'package:flutter_product_recruit/model/managesource_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class GetManageSourceService {
  List<ManageSourceModel> sourcelists = [];
  // ignore: missing_return
  Future<List<ManageSourceModel>> getSourcesList() async {
    String url = "http://176.9.137.77:3001/imap/get";

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
        sourcelists.add(ManageSourceModel.fromJson(prod));
      }
      print("manage source List got successfully");
      return sourcelists;
    } else {
      print("error in getting managesource lists");
    }
  }
}
