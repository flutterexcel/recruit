// ignore_for_file: deprecated_member_use, must_be_immutable, missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/jobs_overview_bloc/jobs_overview.dart';

import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step2.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step6/step6.dart';

import 'package:flutter_product_recruit/screens/7_step_screens/step7.dart';

import 'package:flutter_product_recruit/screens/kanban_screen.dart';
import 'package:flutter_product_recruit/services/jobs_overview/job_deactivate_service.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/job_description.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/jobtitle/activateconfirmdialouge.dart';

import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../UiConstant/app_colors.dart';

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

  void _popupDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: ActivateConfirmDialouge(
            id: id,
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: getData.length,
          itemBuilder: (contex, index) {
            return Visibility(
              visible: getData[index].activeStatus ? true : false,
              child: ListTile(
                  dense: true,
                  title: FractionallySizedBox(
                    widthFactor: 1.1,
                    child: Container(
                        margin: EdgeInsets.only(top: 10),
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
                                  width: 210,
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
                                        child: Text('Deactivate'),
                                      ),
                                      onTap: () async {
                                        print(getData[index].jobListId);
                                        print("-->${getData[index].id}");
                                        JobDeactivationModel res =
                                            await DeactivateJobService
                                                .deactivateJob(
                                                    "",
                                                    getData[index].id,
                                                    false,
                                                    "");

                                        if (res.status == 1) {
                                          Utils.showSnackBar(
                                              context,
                                              "Succesfully Deactivated",
                                              AppColors.Green);
                                          context
                                              .bloc<JobsOverviewBlocBloc>()
                                              .add(JobsOverviewInitial());
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             JobsOverview()));
                                        } else {
                                          Utils.showSnackBar(context,
                                              "Invalid Id", AppColors.Red);
                                        }

                                        // Navigator.pop(context, 'Yes');
                                      },
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
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              // width: 200,
                              child: GridView.builder(
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 10,
                                          crossAxisSpacing: 2),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: getData[index].userDetail.length,
                                  itemBuilder: (context, index2) {
                                    return !getData[index]
                                            .userDetail[index2]
                                            .imageUrl
                                            .contains('.svg')
                                        ? Tooltip(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        getData[index]
                                                            .userDetail[index2]
                                                            .imageUrl,
                                                      ))),
                                            ),
                                            message: getData[index]
                                                .userDetail[index2]
                                                .name,
                                          )
                                        :
                                        // Container(

                                        //   child: Image.network(
                                        //     getData[index].userDetail[index2].imageUrl,
                                        //     fit: BoxFit.contain,
                                        //   ),
                                        // );
                                        Tooltip(
                                            child: SvgPicture.network(
                                              getData[index]
                                                  .userDetail[index2]
                                                  .imageUrl,
                                            ),
                                            message: getData[index]
                                                .userDetail[index2]
                                                .name,
                                          );
                                  }),
                            )
                          ],
                        )),
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
                      ? JobDescription(
                          getData[index], _listJobTag[index].listJobTag)
                      : Center()),
            );
          },
        ),
        const SizedBox(
          height: 15,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: getData.length,
            itemBuilder: (contex, index) {
              return Visibility(
                visible: !getData[index].activeStatus ? true : false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Contain(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    borderrad: 5,
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Textt(
                                  text: getData[index].title,
                                  size: 15,
                                  tcolor: AppColors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${getData[index].unreadEmails.toString()} new",
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 16,
                                        fontFamily: "RobotRegular"),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      child: Icon(
                                        Icons.file_copy,
                                        color: AppColors.grey,
                                      ),
                                      onTap: () {
                                        _popupDialog(
                                            context, getData[index].id);
                                      }),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: AppColors.grey,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
