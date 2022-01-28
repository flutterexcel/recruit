import 'dart:convert';
import 'dart:io';

import 'package:flutter_product_recruit/model/profile/update_profile.dart';
import 'package:flutter_product_recruit/services/post_service.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:http/http.dart' as http;

class UserProfileUpdate {
  PostService postService = new PostService();

  Future<ProfileUpdate> userprofileUpdate(
      String name, String phoneNo, String signature) async {
    String url = "http://176.9.137.77:3001/user/update/profile";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    Map data = {
      'name': name,
      'phoneNo': phoneNo,
      'signature': signature,
    };
    return postService.post(apiUrl, body: data).then((value) {
      return ProfileUpdate.fromJson(value);
    });
  }

  Future<ProfileUpdate> changePassword(
      String confirmPassword, String newPassword, String oldPassword) async {
    String url = "http://176.9.137.77:3001/account/update_password";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    Map data = {
      'confirm_password': confirmPassword,
      'new_password': newPassword,
      'old_password': oldPassword,
    };
    final response = await http.put(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print("Success change password");
      return ProfileUpdate.fromJson(jsonDecode(response.body));
    } else {
      print("error remove permission");
      return ProfileUpdate.fromJson(jsonDecode(response.body));
    }
  }

  //update profile imageName
  Future<ProfileUpdate> userProfileImage(File image) async {
    print("image-----------$image");
    String url = "http://176.9.137.77:3001/user/userImage/upload";

    Map<String, String> queryParams = {
      'accessToken': StorageUtil.getToken(),
    };
    String queryString = Uri(queryParameters: queryParams).query;
    String apiUrl = url + '?' + queryString;

    Map data = {
      'image': image,
    };
    final response1 = await http.post(
      apiUrl,
      body: data,
    );
    print(response1);

    if (response1.statusCode == 200) {
      print("Success image upload");
      return ProfileUpdate.fromJson(jsonDecode(response1.body));
    } else {
      print("error image upload");
      return ProfileUpdate.fromJson(jsonDecode(response1.body));
    }
  }
}
