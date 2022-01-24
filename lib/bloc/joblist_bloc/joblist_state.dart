import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/getjoblist_model.dart';

abstract class JobListState extends Equatable {
  JobListState();
  List<Object> get props => [];
}

class JobListInitialState extends JobListState {}

// ignore: must_be_immutable
class GetJobListState extends JobListState {
  List<GetJobListModel> jobLists;

  GetJobListState({this.jobLists});

  List<Object> get props => [jobLists];
}

class JobListFailureState extends JobListState {}
