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
    print("Enter in getCandididateCvInfo");
    var data = await CandidateCvInfoService()
        .getCandididateCvInfo(jobTagValue, jobToken);

    print("data---->$data");

    return data;
  }
}
