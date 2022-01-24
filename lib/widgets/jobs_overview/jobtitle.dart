// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/screens/kanban_screen.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/job_description.dart';

import '../../UiConstant/app_colors.dart';

class JobTitle extends StatefulWidget {
  List<JobList> getData;

  List<ListJobTag> _listJobTag;
  JobTitle(this.getData, this._listJobTag);
  List<bool> isTitleTap = new List();
  @override
  _JobTitleState createState() {
    for (int i = 0; i < getData.length; i++) {
      isTitleTap.add(false);
    }
    return _JobTitleState(getData, isTitleTap, _listJobTag);
  }
}

class _JobTitleState extends State<JobTitle> {
  List<JobList> getData;
  List<bool> isTitleTap;
  // List<JobTag> _jobTag;
  List<ListJobTag> _listJobTag;
  _JobTitleState(this.getData, this.isTitleTap, this._listJobTag);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: getData.length,
      itemBuilder: (contex, index) {
        return ListTile(
            dense: true,
            title: FractionallySizedBox(
              widthFactor: 1.1,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 65,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[350],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: isTitleTap[index]
                          ? Radius.circular(0)
                          : Radius.circular(10),
                      bottomRight: isTitleTap[index]
                          ? Radius.circular(0)
                          : Radius.circular(10),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        getData[index].candidateProfile,
                        style: TextStyle(color: AppColors.Black, fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      child: Text(
                        "${getData[index].unreadEmails.toString()} new  ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: AppColors.Grey_Font,
                            fontSize: 16,
                            fontFamily: "RobotRegular"),
                      ),
                    ),
                    IconButton(
                        icon: Icon(isTitleTap[index]
                            ? Icons.arrow_drop_down
                            : Icons.arrow_left),
                        onPressed: () {
                          if (isTitleTap[index] == false) {
                            setState(() {
                              isTitleTap[index] = true;
                            });
                          } else if (isTitleTap[index] == true) {
                            setState(() {
                              isTitleTap[index] = false;
                            });
                          }
                        })
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => KanbanScreen(
                        _listJobTag[index].listJobTag,
                        getData[index].candidateProfile,
                        getData[index].id)),
              );
            },
            subtitle: isTitleTap[index] == true
                ? JobDescription(getData[index], _listJobTag[index].listJobTag)
                : Center());
      },
    );
  }
}
