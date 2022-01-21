import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';

abstract class ManageSpamEvent extends Equatable {
  const ManageSpamEvent();
  @override
  List<Object> get props => [];
}

class ManageSpamInitialEvent extends ManageSpamEvent {}

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


