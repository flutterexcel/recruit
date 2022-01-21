import 'package:equatable/equatable.dart';

abstract class JobListEvent extends Equatable {
  JobListEvent();
  List<Object> get props => [];
}

class JobListInitialEvent extends JobListEvent {}
