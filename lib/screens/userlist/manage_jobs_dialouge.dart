// ignore_for_file: must_be_immutable, deprecated_member_use, missing_return
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_bloc.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_event.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_state.dart';

import 'package:flutter_product_recruit/widgets/loader.dart';

// ignore: camel_case_types

class ManageJobsDialouge extends StatefulWidget {
  var userId;

  ManageJobsDialouge({this.userId});
//  var state;

  // ManageJobsDialouge({this.state});

  @override
  State<ManageJobsDialouge> createState() => _ManageJobsDialougeState();
}

class _ManageJobsDialougeState extends State<ManageJobsDialouge> {
  final TextEditingController textEditingController =
      new TextEditingController();
  List<bool> _value = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List data = [];

  final _formKey = GlobalKey<FormState>();

  // void getspam() async {
  //   var res = await GetEmailSpamService.getManageSpamEmail();
  //   data = res;
  //   print(data);
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  // void getjoblist() async {
  //   GetJobListService getJobListService = new GetJobListService();
  //   await getJobListService.getJobList();
  // }

  @override
  Widget build(BuildContext context) {
    print("user id ${widget.userId}");

    // Future.delayed(Duration.zero, () async {
    // setState(() {
    //   _value[0] = true;
    // });
    // });
    // context.bloc<JobListBloc>().add(JobListInitialEvent());

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Manage Jobs',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 18,
                          fontFamily: 'RobotRegular',
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Active Jobs',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'RobotRegular',
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'In-Active Jobs',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'RobotRegular',
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<JobListBloc, JobListState>(
                      builder: (context, state) {
                    if (state is JobListInitialState) {
                      context.bloc<JobListBloc>().add(JobListInitialEvent());
                      return SizedBox(height: 35, child: Loader());
                    } else if (state is GetJobListState) {
                      List jobTitle = [];
                      //  print("statessss----$state");
                      // print(state.jobLists.length);
                      for (var i = 0; i < state.jobLists.length; i++) {
                        // print("gullusss");
                        // print(state.jobLists[i].title);

                        for (var j = 0;
                            j < state.jobLists[i].userDetail.length;
                            j++) {
                          // print(state.jobLists[i].userDetail[j].email);
                          if (state.jobLists[i].userDetail[j].id ==
                              widget.userId) {
                            print(state.jobLists[i].title);
                            jobTitle.add(state.jobLists[i].title);
                          }
                        }
                      }

                      print("job title list===$jobTitle");

                      // print(state.jobLists[0].userDetail[0].id);
                      return Container(
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.jobLists.length,
                            itemBuilder: (context, index) {
                              for (var i = 0; i < jobTitle.length; i++) {
                                if (jobTitle[i] ==
                                    state.jobLists[index].title) {
                                  print("hii");
                                  // Future.delayed(Duration(seconds: 2),
                                  //     () async {
                                  // setState(() {
                                  _value[index] = true;
                                  // });
                                  // });
                                  // break;
                                }
                              }

                              return CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(state.jobLists[index].title),
                                  activeColor: const Color(0xFF00E5FF),
                                  checkColor: Colors.white,
                                  value: _value[index],
                                  onChanged: (value) {
                                    print(value);
                                    // setState(() {
                                    _value[index] = value;
                                    // });
                                  });
                            }),
                      );
                    } else
                      return Container();
                  }),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                  height: 35,
                  // minWidth: 2,
                  color: AppColors.Orange,
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 13),
                  ),
                  textColor: Colors.white,
                  onPressed: () async {}),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
