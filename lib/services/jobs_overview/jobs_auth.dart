import 'package:flutter_product_recruit/model/jobs_overview/hiring_team_model.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/services/jobs_overview/hiring_team_service.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobs_list_service.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobs_overview_service.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobtagservice.dart';

class JobAuthService {
  Future<List<JobList>> getJobList(String token) async {
    List<JobList> data;
    await JobsListServices().getJobList(token).then((value) {
      data = value;
    });
    return data;
  }

  Future<List<JobsOverviewModel>> getJobsOverview(String token) async {
    List<JobsOverviewModel> data;
    await JobsOverviewService().getJobList(token).then((value) {
      data = value;
    });
    return data;
  }

  Future<List<JobTag>> getJobTag(String jobToken, String token) async {
    List<JobTag> data;
    await JobTagService().getJobList(jobToken, token).then((value) {
      data = value;
    });
    return data;
  }

  Future<List<HiringTeamModel>> getHiringTeam() async {
    List<HiringTeamModel> data;
    await HiringTeamService().getHiringTeam().then((value) {
      data = value;
    });
    return data;
  }
}
