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
  DeleteSpamModel res;

  GetSpamList({this.managelist, this.res});

  @override
  List<Object> get props => [managelist];
}

class ManageSpamFailure extends MangeSpamState {}

// class AddEmailSuccess extends MangeSpamState {
//   AddSpamModel addemailModel;
//   AddEmailSuccess({this.addemailModel});
// }
