import 'package:equatable/equatable.dart';

abstract class PipeLineEvent extends Equatable {
  PipeLineEvent();
  List<Object> get props => [];
}

class PipeLineInitialEvent extends PipeLineEvent {}

// ignore: must_be_immutable
// class AddUserEvent extends PipeLineEvent {
//   String name;
//   AddUserEvent({this.name});
//   List<Object> get props => [name];
// }

// ignore: must_be_immutable
// class DeleteUserEvent extends PipeLineEvent {
//   String id;
//   DeleteUserEvent(String string, {this.id});
//   List<Object> get props => [id];
// }
