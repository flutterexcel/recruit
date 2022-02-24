import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/services/kanban_service/candidateCvInfoService.dart';
import 'package:flutter_product_recruit/services/kanban_service/jobTagDataService.dart';

class KanbanAuthService {
  Future<Map<String, JobTagData>> getJobTagData(String jobToken) async {
    print("KanbanAuthServicedata-->");
    Map data = await JobTagDataService().getJobTagData(jobToken);
    print("getJobTagData-->$data");
    return data;
  }

  Future getCandididateCvInfo(String jobTagValue, jobToken) async {
    print("Enter in getCandididateCvInfo-->$jobTagValue");
    print("Enter in jobToken-->$jobToken");
    var data = await CandidateCvInfoService()
        .getCandididateCvInfo(jobTagValue, jobToken);

    print("data---->$data");

    return data;
  }

  // Future getCandididateUnreadCvInfo(String jobProfileId, int limit, int page,
  //     String listJobTagId, bool unread) async {
  //   var data = await CandidateCvInfoService().getCandididateUnreadCvInfo(
  //       jobProfileId, limit, page, listJobTagId, unread);

  //   print("data---->$data");

  //   return data;
  // }
}
