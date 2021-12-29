part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {}
class LogOutEvent extends LoginEvent{}

class LoginWithEmail extends LoginEvent {
  String email, password;
  LoginWithEmail(this.email, this.password);
  List<Object> get props => [email, password];
}
