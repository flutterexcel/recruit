import 'dart:convert';

import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';

import '../../url_config.dart';

import 'package:http/http.dart' as http;

class JobTagService {
  List<JobTag> jobTag = new List();
  Future<List<JobTag>> getJobList(String jobToken, String token) async {
    String url = await UrlConfig.jobsListCalling(
            action: "jobsOverviewCalling", endPoints: "tag/$jobToken")
        .forFirstEnvironment();
    Map<String, String> queryParam = {'accessToken': token};
    String queryString = Uri(queryParameters: queryParam).query;
    String apiUrl = url + '?' + queryString;

    var res = await http.get(apiUrl);
    List<dynamic> values = json.decode(res.body);
    for (int i = 0; i < values.length; i++) {
      Map<String, dynamic> map = values[i];
      jobTag.add(JobTag.fromJson(map));
    }

    return jobTag;
  }
}
