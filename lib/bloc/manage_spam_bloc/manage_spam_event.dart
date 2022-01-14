import 'package:equatable/equatable.dart';

abstract class ManageSpamEvent extends Equatable {
  const ManageSpamEvent();
  @override
  List<Object> get props => [];
}

class ManageSpamInitialEvent extends ManageSpamEvent {}
