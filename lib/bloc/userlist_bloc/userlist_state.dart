import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';

abstract class UserListState extends Equatable {
  UserListState();
  List<Object> get props => [];
}

class UserListInitialState extends UserListState {}

// ignore: must_be_immutable
class GetUserListState extends UserListState {
  List<UserListsModel> userLists;

  GetUserListState({this.userLists});

  List<Object> get props => [userLists];
}

class UserListFailureState extends UserListState {}
