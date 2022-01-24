// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobtagservice.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../UiConstant/app_colors.dart';

class JobBar extends StatelessWidget {
  JobTagService jobTagService = new JobTagService();
  List<JobTag> listJobTag;
  JobList jobList;
  JobBar({this.jobList, this.listJobTag});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 13,
        ),
        Container(
          width: 235,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              color: Colors.grey[350],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                  radius: 57.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent:
                      (jobList.hiredUnattended.length) / listJobTag[5].count < 1
                          ? (jobList.hiredUnattended.length) /
                              listJobTag[5].count
                          : 1,
                  center: new Text(
                    jobList.hiredUnattended.length.toString(),
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.Red),
              Text("hired candidates pending\nyour action"),
              SizedBox(
                width: 7,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 235,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                color: Colors.grey[350],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularPercentIndicator(
                  radius: 55.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: jobList.interviewUnattended.length /
                              listJobTag[2].count <
                          1
                      ? jobList.interviewUnattended.length / listJobTag[2].count
                      : 1,
                  center: new Text(
                    jobList.interviewUnattended.length.toString(),
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: AppColors.Red),
              Text("interviews pending your\naction"),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: 235,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                color: Colors.grey[350],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.Red,
                radius: 30.0,
                child: Text(jobList.unreadCandidate.length.toString()),
              ),
              Text("email pending your reply"),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        GridView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listJobTag.length,
            shrinkWrap: true,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppColors.Grey_Box,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Center(
                      child: Text(
                        listJobTag[index].count.toString(),
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    listJobTag[index].title,
                    style: TextStyle(
                        fontFamily: "RobotRegular", color: Colors.black),
                  )
                ],
              );
            }),
      ],
    );
  }
}
