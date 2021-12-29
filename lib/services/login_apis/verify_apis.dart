import 'package:flutter_product_recruit/url_config.dart';
import 'package:http/http.dart';

class VerifyAccessToken {
  Future<Response> getVerifiyAccessToken(String token, String action) async {
    var apiUrl =
        await (UrlConfig.nextLogin(step: "login", action: action, token: token))
            .forFirstEnvironment();
    return await get(apiUrl).then((value) {
      return value;
    });
  }
}
