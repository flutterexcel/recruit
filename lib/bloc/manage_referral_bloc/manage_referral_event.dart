import 'package:equatable/equatable.dart';

abstract class ManagerReferralEvent extends Equatable {
  const ManagerReferralEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ManageReferralInitialEvent extends ManagerReferralEvent {}

class AddReferralEvent extends ManagerReferralEvent {
  String email;
  AddReferralEvent(this.email);
  List<Object> get props => [email];
}
