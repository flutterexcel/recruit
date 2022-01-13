import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';

abstract class MangeSpamState extends Equatable {
  MangeSpamState();

  @override
  List<Object> get props => [];
}

class MangeSpamInitial extends MangeSpamState {}

class GetSpamList extends MangeSpamState {
  List<ManageSpamList> managelist;

  GetSpamList({this.managelist});
}

class ManageSpamFailure extends MangeSpamState {}
