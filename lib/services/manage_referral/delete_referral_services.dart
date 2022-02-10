// ignore_for_file: missing_return

import 'dart:convert';
import 'package:flutter_product_recruit/UiConstant/appurl.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Delete_Spam_Email_Service {
  // ignore: non_constant_identifier_names
  static Future<DeleteSpam> deleteReferral(String id) async {
    String url = "$appUrl/spamList/delete/$id";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = url + '?' + queryString;

    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Referral Successfully Deleted");
      return DeleteSpam.fromJson(jsonDecode(response.body));
    } else {
      print("error in referral deletion");
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
