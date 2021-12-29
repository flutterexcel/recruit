import 'dart:convert';

import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart';

import '../storage_service.dart';

class CandidateCvInfoService {
  final JsonDecoder _jsonDecoder = JsonDecoder();

  List jobTags = new List();

  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  Future getCandididateCvInfo(String jobTagValue, jobToken) async {
    String url = await UrlConfig.getCandididateCvInfo(
            action: 'getCandididateCvInfo',
            jobTagValue: jobTagValue,
            midPoints: '/job_profile/0/',
            jobToken: jobToken,
            endPoints: '/True')
        .forFirstEnvironment();

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
      'account-name': StorageUtil.getDomain().toLowerCase()
    };
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    var res = await get(apiUrl);
    var responseBody = _jsonDecoder.convert(res.body);
    Map<String, dynamic> jsonParsedKey = responseBody['candidate_map'];
    jsonParsedKey.forEach((key, value) {
      mapCandidateData.putIfAbsent(
          key, () => CandidateCvInfoModel.fromJson(value));
    });
    return mapCandidateData;
  }
}
