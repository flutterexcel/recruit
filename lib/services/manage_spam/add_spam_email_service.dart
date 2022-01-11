import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Add_Spam_Email_Service {
  static Future<UpdateEmail> addManageSpamEmail(String email) async {
    final response = await http.post(
      Uri.parse(
          'http://176.9.137.77:3001/spamData/add?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTExVDA1OjE4OjMwLjk4M1oiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxODc4MzEwLCJleHAiOjE2NzM0MTQzMTB9.y6tF39v_3c8tAO8aiS_WsScox4itm3Kgz6JSZNgan9c'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      print("Success");
      return UpdateEmail.fromJson(jsonDecode(response.body));
    } else {
      print("error");
      throw Exception('Failed to create album.');
    }
  }
}

// To parse this JSON data, do
//
//     final updateEmail = updateEmailFromJson(jsonString);

List<UpdateEmail> updateEmailFromJson(String str) => List<UpdateEmail>.from(
    json.decode(str).map((x) => UpdateEmail.fromJson(x)));

String updateEmailToJson(List<UpdateEmail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpdateEmail {
  UpdateEmail({
    this.error,
    this.message,
  });

  int error;
  String message;

  factory UpdateEmail.fromJson(Map<String, dynamic> json) => UpdateEmail(
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
      };
}
