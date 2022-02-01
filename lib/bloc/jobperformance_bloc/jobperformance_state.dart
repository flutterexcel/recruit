import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/jobperformance_model.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';

abstract class JobPerformanceState extends Equatable {
  JobPerformanceState();
  List<Object> get props => [];
}

class JobPerformanceInitialState extends JobPerformanceState {}

// ignore: must_be_immutable
class GetJobPerformanceState extends JobPerformanceState {
  List<JobPerformanceModel> jobpPerformanceLists;
  List<UserListsModel> getUserLists;

  GetJobPerformanceState({this.jobpPerformanceLists, this.getUserLists});

  List<Object> get props => [jobpPerformanceLists];
}

class JobPerformanceFailureState extends JobPerformanceState {}
