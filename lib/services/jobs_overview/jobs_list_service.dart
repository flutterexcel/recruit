import 'dart:convert';

import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart' as http;

class JobsListServices {
  List<JobList> jobList = new List();
  Future<List<JobList>> getJobList(String token) async {
    String url = await UrlConfig.jobsListCalling(
            action: "jobListCalling", endPoints: "job-profile/list")
        .forFirstEnvironment();
    Map<String, String> queryParam = {'accessToken': token};
    String queryString = Uri(queryParameters: queryParam).query;
    String apiUrl = url + '?' + queryString;
    var res = await http.get(apiUrl);
    List<dynamic> values = json.decode(res.body);
    for (int i = 0; i < values.length; i++) {
      Map<String, dynamic> map = values[i];
      jobList.add(JobList.fromJson(map));
    }
    return jobList;
  }
}
