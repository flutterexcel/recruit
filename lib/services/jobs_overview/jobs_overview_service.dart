// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';

import '../../url_config.dart';

class JobsOverviewService {
  List<JobsOverviewModel> jobsOverviewList = new List();
  Future<List<JobsOverviewModel>> getJobOverview(String token) async {
    String url = await UrlConfig.jobsListCalling(
            action: "jobsOverviewCalling", endPoints: "dashboard/jobs-overview")
        .forFirstEnvironment();
    Map<String, String> queryParam = {'accessToken': token};
    String queryString = Uri(queryParameters: queryParam).query;
    String apiUrl = url + '?' + queryString;
    print("bivhbotbononioi gtio gnioniobbb$apiUrl");

    var res = await http.get(apiUrl);
    List<dynamic> values = json.decode(res.body);
    print("brvbhrvbobeipvpebui$values");
    for (int i = 0; i < values.length; i++) {
      Map<String, dynamic> map = values[i];
      print("brvbhrvbobeipvpebui$map");
      jobsOverviewList.add(JobsOverviewModel.fromJson(map));
    }
    print("bivhbotbobbb");
    return jobsOverviewList;
  }
}
