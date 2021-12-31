import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/userLog/user_log.dart';

abstract class UserLogState extends Equatable {
  const UserLogState();
  @override
  List<Object> get props => [];
}

class UserLogStateInitial extends UserLogState {}

class UserLogViewState extends UserLogState {
  List<UserLog> userLog;
  UserLogViewState({this.userLog});
}