import 'package:equatable/equatable.dart';

abstract class ManageSpamEvent extends Equatable {
  const ManageSpamEvent();
  @override
  List<Object> get props => [];
}

class ManageSpamInitialEvent extends ManageSpamEvent {}

// ignore: must_be_immutable
class DeleteSpamEvent extends ManageSpamEvent {
  String id;
  DeleteSpamEvent(this.id);
  List<Object> get props => [id];
}

// class AddEmailEvent extends ManageSpamEvent {
//   String email;
//   AddEmailEvent(this.email);
//   List<Object> get props => [email];
// }


