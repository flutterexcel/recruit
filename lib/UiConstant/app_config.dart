import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  String baseUrl;

  AppConfig({this.baseUrl});

  AppConfig.withMocks({this.baseUrl});
  static Future<AppConfig> forEnvironment(String url) async {
    // load the json file
    final contents = await rootBundle.loadString(
      'assets/config/login.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(
        baseUrl: json['baseUrl'] + json['devUrl'] + json['port'] + json['url']);
  }
}
