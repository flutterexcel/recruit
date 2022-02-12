import 'dart:convert';

import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:http/http.dart';

import '../../url_config.dart';
import '../storage_service.dart';

class JobTagDataService {
  final JsonDecoder _jsonDecoder = JsonDecoder();
  // ignore: deprecated_member_use
  List jobTags = new List();
  JobTagData jobTagData;
  Future getJobTagData(String jobToken) async {
    print("Enter in getJobTagData");
    String url = await UrlConfig.getJobTagData(
            action: "getJobTagData",
            jobToken: jobToken,
            endPoints: '/job_profile/0')
        .forFirstEnvironment();

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
      'account-name': 'excellencerecruit'
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    var res = await get(apiUrl);
    var responseBody = _jsonDecoder.convert(res.body);
    print("responseBody-->$responseBody");

    var jsonParsedKey = responseBody;

    jsonParsedKey.keys.forEach((element) {
      jobTags.add(element);
    });
    print("jobTags---->$jobTags");
    print("Hii");
    Map<String, JobTagData> mapJobTagData = new Map();
    for (int i = 0; i < jobTags.length; i++) {
      Map<String, dynamic> map = responseBody[jobTags[i]];
      print("----<>mapJobTagData-->$map");
      try {
        mapJobTagData[jobTags[i]] = JobTagData.fromJson(map);
      } catch (e) {
        print(e.toString());
      }

      print("----<>mapJobTagData-->${mapJobTagData[jobTags[i]]}");
    }
    print("----<>mapJobTagData-->$mapJobTagData");

    return mapJobTagData;
  }
}
