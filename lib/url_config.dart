import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class UrlConfig {
  @required
  String step;
  @required
  String action;
  String token;
  String jobToken;
  String url;
  String domain;
  String endPoints;
  String jobTagValue;
  String midPoints;
  UrlConfig({this.url});
  UrlConfig.firstLogin({this.step, this.action});
  UrlConfig.nextLogin({this.step, this.action, this.token});
  UrlConfig.aiCalling({this.step, this.token});
  UrlConfig.logoCalling({this.step, this.action, this.domain});
  UrlConfig.domainCalling({this.action, this.domain});
  UrlConfig.jobsListCalling({this.action, this.endPoints});
  UrlConfig.jobsOverviewCalling({this.action, this.endPoints});
  UrlConfig.hiringTeam({this.action, this.endPoints});
  UrlConfig.userLogs({this.action, this.endPoints});
  UrlConfig.getJobTagData({this.action, this.jobToken, this.endPoints});
  UrlConfig.getCandididateCvInfo(
      {this.action,
      this.jobToken,
      this.midPoints,
      this.jobTagValue,
      this.endPoints});

  Future<String> forFirstEnvironment() async {
    final config = await rootBundle.loadString('assets/config/login.json');
    final json = jsonDecode(config);

    if (action.contains("calllogo")) {
      url = json['companyLogo'] + domain + json['icon'];
    } else if (action.contains('domain')) {
      if (domain.contains('DevRecruit')) {
        url = "http://176.9.137.77:3001/account/logo/image";
      } else {
        url = json['baseUrl'] + domain + json['domainUrl'];
      }
    } else if (action.contains("user/login")) {
      url = json['baseUrl'] + json['devUrl'] + json['port'] + action;
    } else if (action.contains("jobListCalling")) {
      url = json['baseUrl'] + json['devUrl'] + json['port'] + endPoints;
    } else if (action.contains("jobsOverviewCalling")) {
      url = json['baseUrl'] + json['devUrl'] + json['port'] + endPoints;
    } else if (action.contains("hiringTeam")) {
      url = json['baseUrl'] + json['devUrl'] + json['port'] + endPoints;
    } else if (action.contains('getJobTagData')) {
      url = json['aiBaseUrl'] + json['aiUrl'] + jobToken + endPoints;
    } else if (action.contains('userlogs')) {
      url = json['baseUrl'] + json['devUrl'] + json['port'] + endPoints;
    } else if (action.contains('getCandididateCvInfo')) {
      url = json['aiBaseUrl'] +
          json['cvAiUrl'] +
          jobToken +
          midPoints +
          jobTagValue +
          endPoints;
    }
    return url;
  }
}
