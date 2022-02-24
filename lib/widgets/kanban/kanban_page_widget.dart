import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/bloc/kanban_bloc/kanban_bloc.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/widgets/kanban/checkJobData.dart';
import 'package:flutter_product_recruit/widgets/kanban/hiredJobData.dart';
import 'package:flutter_product_recruit/widgets/kanban/holdJobData.dart';
import 'package:flutter_product_recruit/widgets/kanban/interviewJobData.dart';
import 'package:flutter_product_recruit/widgets/kanban/newJobData.dart';
import 'package:flutter_product_recruit/widgets/kanban/rejectJobData.dart';
import 'package:flutter_product_recruit/widgets/kanban/shortlistJobData.dart';

import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

import '../../UiConstant/app_colors.dart';

// ignore: must_be_immutable
class KanbanPageWidget extends StatefulWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  Map<String, JobTagData> mapJobTagData = new Map();
  String title;
  List<JobTag> listJobTag;
  String jobToken;

  KanbanPageWidget(
      {this.jobToken,
      this.listJobTag,
      this.title,
      this.mapCandidateData,
      this.mapJobTagData});

  @override
  _KanbanPageWidgetState createState() => _KanbanPageWidgetState(
      jobToken, listJobTag, title, mapCandidateData, mapJobTagData);
}

class _KanbanPageWidgetState extends State<KanbanPageWidget> {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  Map<String, JobTagData> mapJobTagData = new Map();
  List<JobTag> _listJobTag;
  String title;
  int left = 0;
  String jobTagId;
  List<Datum> resumeData = [];
  Color lightColor;
  Color darkColor;
  _KanbanPageWidgetState(this.jobTagId, this._listJobTag, this.title,
      this.mapCandidateData, this.mapJobTagData);

  generateCandidateList(int i) {
    try {
      resumeData.clear();
      if (_listJobTag[i].roundDetails.length != 0) {
        for (int j = 0; j < _listJobTag[i].roundDetails.length; j++) {
          if (mapJobTagData.containsKey(_listJobTag[i].roundDetails[j].id)) {
            for (int k = 0;
                k <
                    mapJobTagData[_listJobTag[i].roundDetails[j].id]
                        .data
                        .length;
                k++) {
              resumeData.add(
                  mapJobTagData[_listJobTag[i].roundDetails[j].id].data[k]);
            }
          }
        }
      } else if (_listJobTag[i].roundDetails.length == 0) {
        for (int k = 0; k < mapJobTagData[_listJobTag[i].id].data.length; k++) {
          resumeData.add(mapJobTagData[_listJobTag[i].id].data[k]);
        }
      }
      return resumeData;
    } catch (e) {
      print("Enter in generateCandidateList");
      return resumeData;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("mapCandidateData111111111--->$mapCandidateData");
    print("listtgJob--->${_listJobTag[left].id}");
    if (left == 0) {
      darkColor = AppColors.Blue;
      lightColor = AppColors.Light_Blue;
    } else if (left == 1) {
      darkColor = AppColors.Orange;
      lightColor = AppColors.Light_Orange;
    } else if (left == 2) {
      darkColor = AppColors.Voilet;
      lightColor = AppColors.LIght_Voilet;
    } else if (left == 3) {
      darkColor = AppColors.Green;
      lightColor = AppColors.Light_Green;
    } else if (left == 4) {
      darkColor = AppColors.Grey;
      lightColor = AppColors.Light_Grey;
    } else {
      darkColor = AppColors.Red;
      lightColor = AppColors.Light_Red;
    }
    print("left--->${generateCandidateList(left).length}");
    return Scaffold(
      drawer: NavigationList(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.Black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(color: AppColors.Black, fontSize: 30),
          textAlign: TextAlign.left,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 10,
              width: 48,
              child: PopupMenuButton(
                //key: _menuKey,
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    child: InkWell(
                      child: Text('Show Only Unread'),
                      onTap: () {
                        // context.bloc<KanbanBloc>().add(KanbanUnreadEvent(
                        //     jobTagId, 25, 1, _listJobTag[left].id, true));
                      },
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: InkWell(
                      child: Text('Mark All Read'),
                      onTap: () {},
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: InkWell(
                      child: Text('Sort By Date'),
                      onTap: () {},
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: InkWell(child: Text('Sort By Score/Sequence')),
                  ),
                  PopupMenuItem<String>(
                    child: InkWell(child: Text('Send Mail To All')),
                  ),
                  PopupMenuItem<String>(
                    child: InkWell(child: Text('Move All To Reject')),
                  ),
                ],
              ),
              // decoration: BoxDecoration(
              //   // border: Border.all(color: outlinecolor),
              //   color: AppColors.blue,
              //   shape: BoxShape.rectangle,
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
            ),
          )
        ],
      ),
      //0->New
      //1->ShortList
      //2-> Interview
      //3-> Reject
      //4 -> Hold
      //5-> Hired
      //6 -> Check
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.Grey_BackGround,
          child: generateCandidateList(left).length != 0
              ? _listJobTag[left].title == 'Interview'
                  ? InterviewJobData(
                      resumeData: generateCandidateList(left),
                      mapCandidateData: mapCandidateData)
                  : _listJobTag[left].title == 'Reject'
                      ? RejectJobData(
                          resumeData: generateCandidateList(left),
                          mapCandidateData: mapCandidateData)
                      : _listJobTag[left].title == 'Hired'
                          ? HiredJobData(
                              resumeData: generateCandidateList(left),
                              mapCandidateData: mapCandidateData)
                          : _listJobTag[left].title == 'Shortlist'
                              ? ShortlistJobData(
                                  resumeData: generateCandidateList(left),
                                  mapCandidateData: mapCandidateData)
                              : NewJobData(
                                  resumeData: generateCandidateList(left),
                                  mapCandidateData: mapCandidateData)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.Black),
                          color: AppColors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Center(
                          child: Textt(
                            text: "- - - - - -",
                            size: 25,
                            fweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )

          // left == 0
          //     ? NewJobData(
          //         resumeData: generateCandidateList(left),
          //         mapCandidateData: mapCandidateData)
          //     : left == 1
          //         ? ShortlistJobData(
          //             resumeData: generateCandidateList(left),
          //             mapCandidateData: mapCandidateData)
          //         : left == 2
          //             ? InterviewJobData(
          //                 resumeData: generateCandidateList(left),
          //                 mapCandidateData: mapCandidateData)
          //             : left == 3
          //                 ? HiredJobData(
          //                     resumeData: generateCandidateList(left),
          //                     mapCandidateData: mapCandidateData)
          //                 : left == 4
          //                     ? HoldJobData(
          //                         resumeData: generateCandidateList(left),
          //                         mapCandidateData: mapCandidateData)
          //                     : left == 5
          //                         ? RejectJobData(
          //                             resumeData: generateCandidateList(left),
          //                             mapCandidateData: mapCandidateData)
          //                         : CheckJobData(
          //                             resumeData: generateCandidateList(left),
          //                             mapCandidateData: mapCandidateData),
          ),

      bottomNavigationBar: Container(
        height: 65,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_listJobTag[left].unread / _listJobTag[left].count).isNaN
                  ? 0
                  : (_listJobTag[left].unread / _listJobTag[left].count),
              valueColor: AlwaysStoppedAnimation<Color>(darkColor),
              backgroundColor: lightColor,
            ),
            Container(
              color: _listJobTag[left].title == 'Shortlist'
                  ? AppColors.orange12
                  : _listJobTag[left].title == 'Interview'
                      ? AppColors.purple
                      : _listJobTag[left].title == 'Hired'
                          ? AppColors.Green
                          : _listJobTag[left].title == 'Hold'
                              ? AppColors.grey
                              : _listJobTag[left].title == 'Reject'
                                  ? AppColors.Red
                                  : AppColors.blue,
              child: ListTile(
                title: Center(
                  child: Column(
                    children: [
                      Text(
                        '${_listJobTag[left].title}',
                        style: TextStyle(
                          fontFamily: 'RobotRegular',
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        ' ${_listJobTag[left].unread}/${_listJobTag[left].count}',
                        style: TextStyle(
                            fontFamily: 'RobotoRegular',
                            color: AppColors.white,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (left > 0) {
                          left = left - 1;
                        } else if (left == 0) {
                          left = _listJobTag.length - 1;
                        }
                      });
                    }),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (left < _listJobTag.length - 1) {
                        left = left + 1;
                      } else if (left == _listJobTag.length - 1) {
                        left = 0;
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
