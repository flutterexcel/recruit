import 'package:flutter_product_recruit/model/domain_model.dart';
import 'package:flutter_product_recruit/model/login/user_model.dart';
import 'package:flutter_product_recruit/services/domain_service.dart';
import 'package:flutter_product_recruit/services/login_apis/login_service.dart';

class AuthenticationService {
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    final data = await LoginService().getUserLoginDetails(email, password);
    return (UserModel.fromJson(data));
  }

  Future<DomainModel> domainApi(String domain) async {
    final data = await DomainService().getDomain(domain);
    return data;
  }
}
