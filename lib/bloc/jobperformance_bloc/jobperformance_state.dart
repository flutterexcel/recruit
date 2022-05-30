import 'package:equatable/equatable.dart';

abstract class JobPerformanceState extends Equatable {
  JobPerformanceState();
  List<Object> get props => [];
}

class JobPerformanceInitialState extends JobPerformanceState {}

// ignore: must_be_immutable
class GetJobPerformanceState extends JobPerformanceState {
  List jobpPerformanceLists;
  //List<UserListsModel> getUserLists;

  GetJobPerformanceState({
    this.jobpPerformanceLists,
  });

  List<Object> get props => [jobpPerformanceLists];
}

class JobPerformanceFailureState extends JobPerformanceState {}
