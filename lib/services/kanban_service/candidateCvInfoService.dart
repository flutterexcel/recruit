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
  Future getCandididateCvInfo(String jobTagValue, String jobToken) async {
    print("jobTagValue-->$jobTagValue");
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
      'account-name': 'excellencerecruit',
    };
    String queryString = Uri(queryParameters: queryParams).query;
    // String apiUrl =
    //     "https://aiapi-2.exweb.in/datasync/filter/fetch/5f732bca7957b10039e5274f/job_profile/0/5f732bca7957b10039e52751/True?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwOWNiNjFlODg3MThlMDAzYThhMTU5MiIsInJvbGUiOiJIUiIsImxhc3RfbG9naW4iOiIyMDIyLTAyLTE2VDA5OjE3OjA2LjUzN1oiLCJwYXNzd29yZCI6IlpEVmFib0JTaDU4VFFOTWg5R0dwd2dQekh3VzVXcTZMcm9wOHlkZVRTWDQ9IiwiaWF0IjoxNjQ1MDAzMDI2LCJleHAiOjE2NzY1MzkwMjZ9.ODma_HXibVZgAd1RzgEaeJRCejFALS8USMSu2py1Wj4&account-name=excellencerecruit";
    String apiUrl = url + '?' + queryString;
    var res = await get(apiUrl);
    var responseBody = _jsonDecoder.convert(res.body);
    print("responseBody------>$responseBody");
    Map<String, dynamic> jsonParsedKey = responseBody['candidate_map'];
    print("jsonParsedKey-->$jsonParsedKey");

    try {
      jsonParsedKey.forEach((key, value) {
        print("value-->$value");
        mapCandidateData.putIfAbsent(key, () {
          return CandidateCvInfoModel.fromJson(value);
        });
        //  CandidateCvInfoModel.fromJson(value);
        print("value-->");
      });
    } catch (e) {
      print("------------------->${e.toString()}");
    }
    print("enterin");

    return mapCandidateData;
  }
}
