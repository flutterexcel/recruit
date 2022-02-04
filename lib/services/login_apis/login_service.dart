import 'package:flutter_product_recruit/services/post_service.dart';

import 'package:flutter_product_recruit/url_config.dart';

class LoginService {
  PostService postService = new PostService();
  Future getUserLoginDetails(String email, String password) async {
    var apiUrl =
        await (UrlConfig.firstLogin(step: "login", action: "user/login"))
            .forFirstEnvironment();
    print("----->$apiUrl");
    Map data = {
      'email': email,
      'password': password,
      'remember_me': 'true',
    };
    return postService.post(apiUrl, body: data).then((value) {
      return value;
    });
  }
}
