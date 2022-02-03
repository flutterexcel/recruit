// import 'dart:convert';
// import 'package:flutter_product_recruit/model/pipeline_model.dart';
// import 'package:http/http.dart' as http;

// // ignore: camel_case_types
// class GetPipeLineService {
//   List<GetPipelineModel> pipelines = [];
//   // ignore: missing_return
//   Future<List<GetPipelineModel>> getPipeLine() async {
//     // String url = "http://176.9.137.77:3001/job-profile/list";

//     // Map<String, String> queryParams = {
//     //   'accessToken': StorageUtil.getToken(),
//     // };

//     // String queryString = Uri(queryParameters: queryParams).query;

//     // String apiUrl = url + '?' + queryString;
//     final response = await http.get(
//       Uri.parse(
//           "http://176.9.137.77:3001/tag/61e5a2bc266c14003a1e9219?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYxZTkyZWZkZDU5M2ViMDAzYTAxM2Q0NiIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTI1VDA3OjMzOjE3LjM3MVoiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQzMDk1OTk3LCJleHAiOjE2NzQ2MzE5OTd9.vsvlJP63QG8FRigZRXiGufaJMiulG6dieun37e4akTM"),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     if (response.statusCode == 200) {
//       print("200 got successfully");
//       var jsonList = jsonDecode(response.body);
//       for (var prod in jsonList) {
//         pipelines.add(GetPipelineModel.fromJson(prod));
//       }
//       print("PipeLine got successfully");

//       return pipelines;
//       //print("Success");
//       // return ManageSpamList.fromJson(jsonDecode(response.body));
//     } else {
//       print("error");
//       // throw Exception('Failed to create album.');
//     }
//   }
// }
