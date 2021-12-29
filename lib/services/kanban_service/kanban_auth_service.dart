import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/services/kanban_service/candidateCvInfoService.dart';
import 'package:flutter_product_recruit/services/kanban_service/jobTagDataService.dart';

class KanbanAuthService {
  Future<Map<String, JobTagData>> getJobTagData(String jobToken) async {
    Map data = await JobTagDataService().getJobTagData(jobToken);
    return data;
  }

  Future getCandididateCvInfo(String jobTagValue, jobToken) async {
    var data=await CandidateCvInfoService().getCandididateCvInfo(jobTagValue, jobToken);
    return data;
  }
}
