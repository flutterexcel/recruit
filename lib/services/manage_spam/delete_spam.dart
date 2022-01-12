import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Delete_Spam_Email_Service {
  static Future<DeleteSpam> DeleteSpamEmail(String id) async {
    final response = await http.delete(
      Uri.parse(
          'http://176.9.137.77:3001/spamList/delete/$id?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTExVDA5OjU3OjAyLjIxMloiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxODk1MDIyLCJleHAiOjE2NzM0MzEwMjJ9.tJRFa_0tR92W6vmsFDuZ4NRGga4PrZ_3S5IXeOdJ0Ak'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Successfully Deleted");
      return DeleteSpam.fromJson(jsonDecode(response.body));
    } else {
      print("error in deletion");
      throw Exception('Failed to create album.');
    }
  }
}

DeleteSpam manageSpamListFromJson(String str) =>
    DeleteSpam.fromJson(json.decode(str));

String manageSpamListToJson(DeleteSpam data) => json.encode(data.toJson());

class DeleteSpam {
  DeleteSpam({
    this.status,
  });

  String status;

  factory DeleteSpam.fromJson(Map<String, dynamic> json) => DeleteSpam(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
