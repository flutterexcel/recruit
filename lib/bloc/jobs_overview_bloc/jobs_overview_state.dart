part of 'jobs_overview_bloc.dart';

abstract class JobsOverviewState extends Equatable {
  const JobsOverviewState();

  @override
  List<Object> get props => [];
}

class JobsOverviewBlocInitial extends JobsOverviewState {}

// ignore: must_be_immutable
class JobsOvervViewPageState extends JobsOverviewState {
  List<JobList> getData;
  List<JobsOverviewModel> jobsOverViewModel;
  List<HiringTeamModel> hirinTeam;
  List<ListJobTag> listJobTag;
  JobsOvervViewPageState(
      {this.getData, this.jobsOverViewModel, this.hirinTeam, this.listJobTag});
  List<Object> get props => [getData, jobsOverViewModel, hirinTeam, listJobTag];
}
