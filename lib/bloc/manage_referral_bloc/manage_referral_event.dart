import 'package:equatable/equatable.dart';

abstract class ManagerReferralEvent extends Equatable {
  const ManagerReferralEvent();
  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [];
}

class ManageReferralInitialEvent extends ManagerReferralEvent {}

// ignore: must_be_immutable
class AddReferralEvent extends ManagerReferralEvent {
  String email;
  AddReferralEvent(this.email);
  List<Object> get props => [email];
}
