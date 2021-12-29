import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';

class CheckJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;
  CheckJobData({this.resumeData, this.mapCandidateData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('CheckJobData'),
    );
  }
}