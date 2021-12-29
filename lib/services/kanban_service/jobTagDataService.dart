import 'dart:convert';

import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:http/http.dart';

import '../../url_config.dart';
import '../storage_service.dart';

class JobTagDataService {
  final JsonDecoder _jsonDecoder = JsonDecoder();
  List jobTags = new List();
  JobTagData jobTagData;
  Future getJobTagData(String jobToken) async {
    String url = await UrlConfig.getJobTagData(
            action: "getJobTagData",
            jobToken: jobToken,
            endPoints: '/job_profile/0')
        .forFirstEnvironment();
    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
      'account-name': StorageUtil.getDomain().toLowerCase()
    };
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    var res = await get(apiUrl);
    var responseBody = _jsonDecoder.convert(res.body);
    Map<String, dynamic> jsonParsedKey = responseBody;
    jsonParsedKey.keys.forEach((element) {
      jobTags.add(element);
    });
    Map<String, JobTagData> mapJobTagData = new Map();
    for (int i = 0; i  < jobTags.length ; i++) {
      Map<String, dynamic> map = responseBody[jobTags[i]];
      mapJobTagData[jobTags[i]] = JobTagData.fromJson(map);
    }

    return mapJobTagData;
  }
}
