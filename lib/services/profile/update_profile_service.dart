import 'package:flutter_product_recruit/model/profile/update_profile.dart';
import 'package:flutter_product_recruit/services/post_service.dart';

import '../../url_config.dart';

class UpdateProfile {
  PostService postService = new PostService();

  Future<ProfileUpdate> userprofileUpdate(
      String name, String phoneNo, String signature) async {
    var apiUrl =
        "http://176.9.137.77:3001/user/update/profile?accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjYwY2IyNjc0ZGM4YjhmMDAzYTgyM2YxYyIsInJvbGUiOiJBZG1pbiIsImxhc3RfbG9naW4iOiIyMDIyLTAxLTEwVDEzOjI2OjMwLjkxMloiLCJwYXNzd29yZCI6InBtV2tXU0JDTDUxQmZraG43OXhQdUtCS0h6Ly9INkIrbVk2RzkvZWlldU09IiwiaWF0IjoxNjQxODIxMTkwLCJleHAiOjE2NzMzNTcxOTB9.-GJUb_PsoARhClwCD-VIsAI1oLv8kocSll0PcS5hCF8";
    Map data = {
      'name': name,
      'phoneNo': phoneNo,
      'signature': signature,
    };
    return postService.post(apiUrl, body: data).then((value) {
      return ProfileUpdate.fromJson(value);
    });
  }
}
