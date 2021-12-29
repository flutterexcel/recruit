part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  UserModel userModel;
  LoginSuccess({this.userModel});
}

class LoginPageState extends LoginState {}

class LoginFailure extends LoginState {}
class LogOutState extends LoginState{}

