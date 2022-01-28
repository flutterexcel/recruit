// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step2.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step6/step6.dart';

import 'package:flutter_product_recruit/screens/7_step_screens/step7.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/job_description.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  height: 90,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              getData[index].title,
                              style: TextStyle(
                                  color: AppColors.Black, fontSize: 20),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "${getData[index].unreadEmails.toString()} new",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                color: Color(0xFF007eff),
                                fontSize: 16,
                                fontFamily: "RobotRegular"),
                          ),
                          IconButton(
                              icon: Icon(isTitleTap[index]
                                  ? Icons.arrow_drop_down
                                  : Icons.arrow_drop_up),
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
                              }),

                          //***** menu button
                          PopupMenuButton(
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('Deactivate');
                                    Navigator.pop(context);
                                  },
                                  child: Text('Deactivate'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('edit job');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Step2()),
                                    );
                                  },
                                  child: Text('Edit Job'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('manage pipeline');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Step6()),
                                    );
                                  },
                                  child: Text('Manage Pipeline'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('manage test');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Step7()),
                                    );
                                  },
                                  child: Text('Manage Tests'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('Manage Job Criteria');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Step5()),
                                    );
                                  },
                                  child: Text('Manage Job Criteria'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('manage team');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Step4()),
                                    );
                                  },
                                  child: Text('Manage Team'),
                                ),
                              )
                            ],
                            onSelected: (_) {},
                            elevation: 8,
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        // width: 200,
                        child: GridView.builder(
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 12),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getData[index].userDetail.length,
                            itemBuilder: (context, index2) {
                              return SvgPicture.network(
                                getData[index].userDetail[index2].imageUrl,
                              );
                            }),
                      )
                    ],
                  )),
            ),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => KanbanScreen(
            //             _listJobTag[index].listJobTag,
            //             getData[index].candidateProfile,
            //             getData[index].id)),
            //   );
            // },
            subtitle: isTitleTap[index] == true
                ? JobDescription(getData[index], _listJobTag[index].listJobTag)
                : Center());
      },
    );
  }
}
