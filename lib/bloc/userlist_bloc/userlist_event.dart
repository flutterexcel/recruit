import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  UserListEvent();
  List<Object> get props => [];
}

class UserListInitialEvent extends UserListEvent {}

// ignore: must_be_immutable
class AddUserEvent extends UserListEvent {
  String name;
  AddUserEvent({this.name});
  List<Object> get props => [name];
}

// ignore: must_be_immutable
class DeleteUserEvent extends UserListEvent {
  String id;
  DeleteUserEvent(String string, {this.id});
  List<Object> get props => [id];
}
