import 'dart:convert';
import 'dart:io';
import 'package:flutter_product_recruit/model/drop_down_model.dart';
import 'package:http/http.dart' as http;

class DomainDropDownService extends HttpOverrides {
  // ignore: missing_return

  static Future<DomainDropDown> fetchDropdoen() async {
    final response = await http.get(Uri.parse(
        'https://aiapi-1.exweb.in/skill/domain_list?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTA3VDA5OjE2OjU5LjU1OVoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxNTQ3MDE5LCJleHAiOjE2NzMwODMwMTl9.kW-6K1HFG7gNLGZC8RWdTrYiM2ft9qnZTh-kD-zfgv4&account-name=devrecruit'));

    if (response.statusCode == 200) {
      print("success in dropdowndomain");
      return DomainDropDown.fromJson(jsonDecode(response.body));
    } else {
      print("error in DomainDropDown");
      throw Exception('Failed to load album');
    }
  }
}
