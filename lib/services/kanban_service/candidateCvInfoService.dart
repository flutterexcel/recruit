import 'dart:convert';

import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart';
import '../storage_service.dart';

class CandidateCvInfoService {
  final JsonDecoder _jsonDecoder = JsonDecoder();

  // ignore: deprecated_member_use
  List jobTags = new List();

  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  Future getCandididateCvInfo(String jobTagValue, jobToken) async {
    print("jobTagValue-->$jobTagValue");
    String url = await UrlConfig.getCandididateCvInfo(
            action: 'getCandididateCvInfo',
            jobTagValue: jobTagValue,
            midPoints: '/job_profile/0/',
            jobToken: jobToken,
            endPoints: '/True')
        .forFirstEnvironment();
    print("url-->$url");

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
      'account-name': 'excellencerecruit'
    };
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    var res = await get(apiUrl);
    var responseBody = _jsonDecoder.convert(res.body);
    Map<String, dynamic> jsonParsedKey = responseBody['candidate_map'];

    print("jsonParsedKey-->$jsonParsedKey");

    jsonParsedKey.forEach((key, value) {
      print("value-->$value");
      mapCandidateData.putIfAbsent(
          key, () => CandidateCvInfoModel.fromJson(value));
      print("value-->");
    });
    print("enterin");

    return mapCandidateData;
  }
}
