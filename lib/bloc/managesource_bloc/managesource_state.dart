import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/managesource_model.dart';

abstract class ManageSourceState extends Equatable {
  ManageSourceState();
  List<Object> get props => [];
}

class ManageSourceInitialState extends ManageSourceState {}

// ignore: must_be_immutable
class GetManageSourceState extends ManageSourceState {
  List<ManageSourceModel> managesourcelists;

  GetManageSourceState({this.managesourcelists});

  List<Object> get props => [managesourcelists];
}

class ManageSourceFailureState extends ManageSourceState {}
