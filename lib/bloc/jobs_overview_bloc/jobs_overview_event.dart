part of 'jobs_overview_bloc.dart';

abstract class JobsOverviewBlocEvent extends Equatable {
  const JobsOverviewBlocEvent();

  @override
  List<Object> get props => [];
}

class JobsOverviewInitial extends JobsOverviewBlocEvent {}
