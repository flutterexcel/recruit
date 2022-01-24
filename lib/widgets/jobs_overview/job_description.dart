// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
// ignore: unused_import
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/widgets/jobbar.dart';

class JobDescription extends StatelessWidget {
  JobList jobList;

  List<JobTag> _listJobTag;
  JobDescription(this.jobList, this._listJobTag);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.transparent),
            left: BorderSide(color: Colors.grey[350]),
            right: BorderSide(color: Colors.grey[350]),
            bottom: BorderSide(color: Colors.grey[350]),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
                width: 24,
              ),
              Image.asset("assets/icons/jobanalytic.svg"),
              JobBar(
                jobList: jobList,
                listJobTag: _listJobTag,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
