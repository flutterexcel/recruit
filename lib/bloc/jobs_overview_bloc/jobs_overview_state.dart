part of 'jobs_overview_bloc.dart';

abstract class JobsOverviewState extends Equatable {
  const JobsOverviewState();

  @override
  List<Object> get props => [];
}

class JobsOverviewBlocInitial extends JobsOverviewState {}

class JobsOvervViewPageState extends JobsOverviewState {
  List<JobList> getData;
  List<JobsOverviewModel> jobsOverViewModel;
  List<HiringTeamModel> hirinTeam;
  List<ListJobTag> listJobTag;
  JobsOvervViewPageState(
      {this.getData, this.jobsOverViewModel, this.hirinTeam,this.listJobTag});
}
