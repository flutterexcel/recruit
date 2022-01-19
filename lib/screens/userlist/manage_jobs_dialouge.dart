// ignore_for_file: must_be_immutable, deprecated_member_use, missing_return
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_bloc.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_event.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_state.dart';

import 'package:flutter_product_recruit/services/getjoblist_service.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';

// ignore: camel_case_types

class ManageJobsDialouge extends StatefulWidget {
//  var state;

  // ManageJobsDialouge({this.state});

  @override
  State<ManageJobsDialouge> createState() => _ManageJobsDialougeState();
}

class _ManageJobsDialougeState extends State<ManageJobsDialouge> {
  final TextEditingController textEditingController =
      new TextEditingController();
  bool _value = false;
  List data = [];

  final _formKey = GlobalKey<FormState>();

  // void getspam() async {
  //   var res = await GetEmailSpamService.getManageSpamEmail();
  //   data = res;
  //   print(data);
  // }

  @override
  void initState() {
    super.initState();
  }

  void getjoblist() async {
    var res = await GetJobListService.getJobList();
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<JobListBloc>().add(JobListInitialEvent());
    // print("new state--${widget.state}");
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    //RegExp regExp = new RegExp(p);
    return SingleChildScrollView(
      child: Flexible(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          //height: 250,
          // width: MediaQuery.of(context).size.width,
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
                        return Loader1();
                      } else if (state is GetJobListState) {
                        print("statessss----${state}");
                        print(state.jobLists.length);
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.jobLists.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  contentPadding: EdgeInsets.all(0),
                                  title: Expanded(
                                      child: Text(state.jobLists[index].title)),
                                  activeColor: const Color(0xFF00E5FF),
                                  checkColor: Colors.white,
                                  value: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });
                                  });
                            });
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
      ),
    );
  }
}