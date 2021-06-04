import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/jobtitle.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_colors.dart';
import 'hiring_team.dart';
import 'main_jobdes.dart';

class JobsOverviewPage extends StatefulWidget {
  List<JobList> getData;
  List<JobsOverviewModel> jobsOverViewModel;

  List<ListJobTag> listJobTag;
  JobsOverviewPage({this.getData, this.jobsOverViewModel, this.listJobTag});
  @override
  _JobsOverviewPageState createState() => _JobsOverviewPageState(
      getData: getData,
      jobsOverViewModel: jobsOverViewModel,
      listJobTag: listJobTag);
}

class _JobsOverviewPageState extends State<JobsOverviewPage> {
  List<JobList> getData;
  List<JobsOverviewModel> jobsOverViewModel;
  List<ListJobTag> listJobTag;
  _JobsOverviewPageState(
      {this.getData, this.jobsOverViewModel, this.listJobTag});
  bool isHiringPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationList(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.Black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Jobs Overview',
          style: TextStyle(color: AppColors.Black, fontSize: 30),
          textAlign: TextAlign.left,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: isHiringPage
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hiring Team",
                          style:
                              TextStyle(color: AppColors.Black, fontSize: 20),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHiringPage = false;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.IconBackground,
                                child: FaIcon(
                                  FontAwesomeIcons.chartBar,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: AppColors.Yello_Box,
                                child: FaIcon(
                                  FontAwesomeIcons.userFriends,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    HiringTeam()
                  ],
                )
              : Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Overview",
                          style:
                              TextStyle(color: AppColors.Black, fontSize: 20),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: AppColors.Yello_Box,
                                child: FaIcon(
                                  FontAwesomeIcons.chartBar,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHiringPage = true;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.IconBackground,
                                child: FaIcon(
                                  FontAwesomeIcons.userFriends,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MainJobDescprition(
                      getData: jobsOverViewModel,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jobs",
                        style: TextStyle(
                          color: AppColors.Black,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    JobTitle(getData, listJobTag),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
