// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';

abstract class AllUserLogState extends Equatable {
  const AllUserLogState();
  @override
  List<Object> get props => [];
}

class AllUserLogInitialState extends AllUserLogState {}

class AllUserLogDropdownState extends AllUserLogState {
  List<UserListsModel> usersList;
  AllUserLogDropdownState({this.usersList});
  @override
  List<Object> get props => [usersList];
}
