import 'dart:convert';

import 'package:flutter_product_recruit/model/jobs_overview/hiring_team_model.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart' as http;

class HiringTeamService {
  final JsonDecoder _jsonDecoder = JsonDecoder();
  // ignore: deprecated_member_use
  List<HiringTeamModel> hiringTeamModel = new List();
  Future<List<HiringTeamModel>> getHiringTeam() async {
    String url = await UrlConfig.hiringTeam(
            action: "hiringTeam", endPoints: "user/list/1/100")
        .forFirstEnvironment();
    Map<String, String> queryParams = {'accessToken': StorageUtil.getToken()};
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;
    var res = await http.get(apiUrl);
    var resData = _jsonDecoder.convert(res.body)['data'];
    for (int i = 0; i < resData.length; i++) {
      Map<String, dynamic> map = resData[i];
      hiringTeamModel.add(HiringTeamModel.fromJson(map));
    }
    return hiringTeamModel;
  }
}
