import 'dart:convert';
import 'dart:io';

import 'package:flutter_product_recruit/model/domain_model.dart';
import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart' as http;

class DomainService extends HttpOverrides {
  Future<DomainModel> getDomain(String domain) async {
    // final ioc = new HttpClient();
    // ioc.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => true;
    // final http = new IOClient(ioc);
    var apiUrl =
        await (UrlConfig.domainCalling(action: "domain", domain: domain)
            .forFirstEnvironment());
    var res = await http.get(apiUrl);
    return DomainModel.fromJson(jsonDecode(res.body));
  }
}
