import 'dart:convert';
import 'package:http/http.dart' as http;

class PostService {
  JsonDecoder _decoder = JsonDecoder();
  Future<dynamic> post(String url, {Map headers, body, encoding}) async {
    return http
        .post(
      url,
      body: body,
    )
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode == 200) {
        print("success");
        return _decoder.convert(res);
      } else {
        throw Exception('invalid response');
      }
    });
  }
}
