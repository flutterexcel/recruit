import 'package:flutter_product_recruit/model/profile/update_profile.dart';
import 'package:flutter_product_recruit/services/post_service.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';

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
}
