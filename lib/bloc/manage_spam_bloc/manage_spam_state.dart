import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';

abstract class MangeSpamState extends Equatable {
  MangeSpamState();

  @override
  List<Object> get props => [];
}

class MangeSpamInitial extends MangeSpamState {}

// ignore: must_be_immutable
class GetSpamList extends MangeSpamState {
  List<SpamListModel> managelist;

  GetSpamList({this.managelist});
}

class ManageSpamFailure extends MangeSpamState {}
