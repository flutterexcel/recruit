import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/jobs_overview/hiring_team_model.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobs_auth.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobtagservice.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';

part 'jobs_overview_event.dart';
part 'jobs_overview_state.dart';

class JobsOverviewBlocBloc
    extends Bloc<JobsOverviewBlocEvent, JobsOverviewState> {
  JobsOverviewBlocBloc() : super(JobsOverviewBlocInitial());
  JobAuthService jobAuthService = new JobAuthService();
  JobTagService jobTagService = new JobTagService();
  @override
  Stream<JobsOverviewState> mapEventToState(
    JobsOverviewBlocEvent event,
  ) async* {
    if (event is JobsOverviewInitial) {
      print("deactivated");
      yield* _mapJobOverviewIitialToState(event);
    }
  }

  Stream<JobsOverviewState> _mapJobOverviewIitialToState(
      JobsOverviewInitial event) async* {
    List<JobList> _getData;
    List<JobsOverviewModel> _jobsOverViewModel;
    List<HiringTeamModel> _hirinTeam;

    // ignore: deprecated_member_use
    List<ListJobTag> _jobTagList = new List();

    try {
      await jobAuthService.getJobList(StorageUtil.getToken()).then((value) {
        _getData = value;
      }).whenComplete(() async {
        print("hii");
        await jobAuthService
            .getJobsOverview(StorageUtil.getToken())
            .then((value) {
          print("fvfvbjvitjbtijt$value");
          _jobsOverViewModel = value;
          print("fvfvbjvitjbtijt");
        });
      }).whenComplete(() async {
        print("hii2");
        await jobAuthService.getHiringTeam().then((value) {
          _hirinTeam = value;
        }).whenComplete(() async {
          print("hii3");
          for (int i = 0; i < _getData.length; i++) {
            await jobAuthService
                .getJobTag(_getData[i].jobListId, StorageUtil.getToken())
                .then((value) {
              print("hjnnii5${_getData.length}");
              print("hii5$value");
              _jobTagList.add(ListJobTag(listJobTag: value));
              print("object");
            });
          }
          print("objec2t");
        });
        print("objec3");
      });
      print("objec4");

      yield JobsOvervViewPageState(
          getData: _getData,
          jobsOverViewModel: _jobsOverViewModel,
          hirinTeam: _hirinTeam,
          listJobTag: _jobTagList);
    } catch (e) {
      print("error in job overview bloc");
      print(e.toString());
    }
  }
}
