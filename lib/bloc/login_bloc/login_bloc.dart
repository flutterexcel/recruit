import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/login/user_model.dart';
import 'package:flutter_product_recruit/services/login_apis/login_authentication_services.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:meta/meta.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  AuthenticationService authenticationService = new AuthenticationService();
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInitialEvent) {
      yield* _mapLoginInitialEvent(event);
    }
    if (event is LoginWithEmail) {
      yield* _mapLoginWithEmailToState(event);
    }
    if (event is LogOutEvent) {
      print("logout event");
      yield* _mapLogOutToState(event);
    }
  }

  Stream<LoginState> _mapLoginInitialEvent(LoginInitialEvent event) async* {
    try {
      var res = await authenticationService.signInWithEmailAndPassword(
          StorageUtil.getUserEmail(), StorageUtil.getPassword());
      yield LoginSuccess(userModel: res);
    } catch (e) {
      yield LoginPageState();
    }
  }

  Stream<LoginState> _mapLogOutToState(LogOutEvent event) async* {
    try {
      StorageUtil.clearCredentials();
      yield LoginPageState();
    } catch (e) {
      yield LoginPageState();
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginWithEmail event) async* {
    try {
      var res = await authenticationService.signInWithEmailAndPassword(
          event.email, event.password);

      StorageUtil.setToken(res.token);
      StorageUtil.setUserName(res.userDetails.name);
      StorageUtil.setUserEmail(res.userDetails.email);
      StorageUtil.setUserProfileImage(res.userDetails.imageName);
      StorageUtil.setUserPhone(res.userDetails.phoneNo.toString());
      StorageUtil.setUserSign(res.userDetails.signature);

      yield LoginSuccess(userModel: res);
    } catch (e) {
      yield LoginFailure();
    }
  }
}
