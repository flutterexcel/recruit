import 'dart:convert';

import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/rejectreason_model.dart';
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
        print("value-->$key");
        mapCandidateData.putIfAbsent(key, () {
          // print("valueeee-->${CandidateCvInfoModel.fromJson(value)}");
          return CandidateCvInfoModel.fromJson(value);
        });
        //  CandidateCvInfoModel.fromJson(value);
        print("valueeee-->${CandidateCvInfoModel.fromJson(value)}");
      });
    } catch (e) {
      print("------------------->${e.toString()}");
    }
    print("enterin");

    return mapCandidateData;
  }

  Future starCandidateMark(String mongo_id, bool value) async {
    String url = '$appUrl/star/starEmail/$value';
    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };
    String body = json.encode({
      'mongo_id': '$mongo_id',
    });
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    print("queryString---->$queryString");
    print("urllllllllllllllll---->----->$apiUrl");
    try {
      print("booooooody-->$body");
      var res = await put(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );
      print("res.statusCode--->${res.statusCode}");
      if (res.statusCode == 200) {
        print("sucesssssssssssssss");
      } else {
        print("erororoor");
      }
    } catch (e) {
      print("guiiuhiofbotrbiptypjo=--->${e.toString()}");
    }
  }

  Future MarkUnreadCandidate(String mongo_id) async {
    String url = '$appUrl/email/mark-as-read/$mongo_id';
    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    try {
      var res = await put(
        apiUrl,
      );

      if (res.statusCode == 200) {
        print("sucesssssssssssssss");
      } else {
        print("erororoor");
      }
    } catch (e) {
      print("guiiuhiofbotrbiptypjo=--->${e.toString()}");
    }
  }

  Future MarkReadCandidate(String mongo_id) async {
    String url = '$appUrl/email/markAsUnread';
    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };
    String body = json.encode({
      'mongo_id': '$mongo_id',
    });

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    try {
      var res = await put(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (res.statusCode == 200) {
        print("sucesssssssssssssss");
      } else {
        print("erororoor");
      }
    } catch (e) {
      print("guiiuhiofbotrbiptypjo=--->${e.toString()}");
    }
  }

  Future RejectCandidate() async {
    String url = '$appUrl/app-setting/Reason';
    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    try {
      var res = await get(
        apiUrl,
      );

      if (res.statusCode == 200) {
        print("sucesssssssssssssss");
        return RejectReasonModel.fromJson(jsonDecode(res.body));
      } else {
        print("erororoor");
      }
    } catch (e) {
      print("guiiuhiofbotrbiptypjo=--->${e.toString()}");
    }
  }

  // Future getCandididateUnreadCvInfo(String jobProfileId, int limit, int page,
  //     String listJobTagId, bool unread) async {
  //   String url = '$appUrl/email/fetch/$jobProfileId/$page/$limit';
  //   print("url-->$url");

  //   Map<String, String> queryParams = {
  //     'accessToken': StorageUtil.getToken(),
  //     'job_profile_id': jobProfileId,
  //     'limit': '$limit',
  //     'page': '$page',
  //     'tag_id': "$listJobTagId",
  //     'unread': '$unread'
  //   };
  //   String queryString = Uri(queryParameters: queryParams).query;
  //   // String apiUrl =
  //   //     "https://aiapi-2.exweb.in/datasync/filter/fetch/5f732bca7957b10039e5274f/job_profile/0/5f732bca7957b10039e52751/True?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwOWNiNjFlODg3MThlMDAzYThhMTU5MiIsInJvbGUiOiJIUiIsImxhc3RfbG9naW4iOiIyMDIyLTAyLTE2VDA5OjE3OjA2LjUzN1oiLCJwYXNzd29yZCI6IlpEVmFib0JTaDU4VFFOTWg5R0dwd2dQekh3VzVXcTZMcm9wOHlkZVRTWDQ9IiwiaWF0IjoxNjQ1MDAzMDI2LCJleHAiOjE2NzY1MzkwMjZ9.ODma_HXibVZgAd1RzgEaeJRCejFALS8USMSu2py1Wj4&account-name=excellencerecruit";
  //   String apiUrl = url + '?' + queryString;
  //   print("queryString---->$queryString");
  //   print("urllllllllllllllll---->----->$apiUrl");
  //   var res = await put(apiUrl);
  //   var responseBody = _jsonDecoder.convert(res.body);
  //   print("respooufgg97tounseBody------>$responseBody");
  //   List jsonParsedKey = responseBody['data'];
  //   print("jsonParslguougoedKey-->$jsonParsedKey");

  //   print("entelighi8rin");

  //   return jsonParsedKey;
  // }
}
