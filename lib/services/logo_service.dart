import 'package:flutter_product_recruit/url_config.dart';


  Future<String> setDomainUrl({String action, String domain}) async {
    String _url = await UrlConfig.logoCalling(
            step: "logo", action: action, domain: domain)
        .forFirstEnvironment();
    return _url;
  }

