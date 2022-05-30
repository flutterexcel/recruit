import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/userLog/user_log.dart';

abstract class UserLogState extends Equatable {
  const UserLogState();
  @override
  List<Object> get props => [];
}

class UserLogStateInitial extends UserLogState {}

// ignore: must_be_immutable
class UserLogViewState extends UserLogState {
  List<Datum> userLog;
  UserLogViewState({this.userLog});
  List<Object> get props => [userLog];
}
