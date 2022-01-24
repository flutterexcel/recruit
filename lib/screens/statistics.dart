// ignore_for_file: deprecated_member_use, missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_bloc.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_events.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_state.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_bloc.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_event.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_state.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Stats extends StatefulWidget {
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  bool isSwitched = false;
  String callLogsdd = 'User';
  List<String> callLogsItems = ['User', 'Test'];

  String activitydd;

  String upcomingInterviewdd = "All";

  List<String> upcomingInterviewItems = ['All'];

  // @override
  // void initState() {
  //   super.initState();
  //   getApplicationStatus();
  // }

  // void getApplicationStatus() async {
  //   print("entered");
  //   GetApplicationStatusService getApplicationStatusService =
  //       new GetApplicationStatusService();
  //   applicationStatusList =
  //       await getApplicationStatusService.getApplicationStatus();
  //   print("---->$applicationStatusList");
  // }

  @override
  Widget build(BuildContext context) {
    print("entered in build");

    return BlocBuilder<ApplicationStatusBloc, ApplicationStatusState>(
        builder: (context, state) {
      if (state is ApplicationStatusInitialState) {
        context
            .bloc<ApplicationStatusBloc>()
            .add(ApplicationStatusInitialEvent());
        return Loader();
      } else if (state is GetApplicationStatusState) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Statistics"),
            ),
            drawer: NavigationList(),
            body: Padding(
              padding: EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      borderrad: 5,
                      outlinecolor: AppColors.purple,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Textt(
                              text:
                                  "${state.applicationStatusList[1].jobOpenings} Job Opennings",
                              size: 17,
                              fweight: FontWeight.bold,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      borderrad: 5,
                      outlinecolor: AppColors.Green,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Textt(
                              text:
                                  "${state.applicationStatusList[0].candidates} Candidates",
                              size: 17,
                              fweight: FontWeight.bold,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 155,
                      borderrad: 5,
                      outlinecolor: AppColors.grey,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Textt(
                                    text:
                                        "${state.applicationStatusList[2].jobApplicants}  Job Applicants",
                                    size: 17,
                                    fweight: FontWeight.bold,
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 New",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.orange12,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Candidates",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.Green,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Interview",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.purple,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Hired",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.Red,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Hold",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Reject",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.Light_Blue,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 First",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.purple,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Second",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.Light_Blue,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Third",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.purple,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Offer",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.Red,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Accepted",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: 4,
                                      height: 25,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Textt(
                                            text: "0 Joined",
                                            size: 17,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      borderrad: 5,
                      outlinecolor: AppColors.grey,
                      //  backcolor: AppColors.purple,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Textt(
                                      text: "Upcoming",
                                      size: 20,
                                      fweight: FontWeight.bold,
                                    ),
                                    Textt(
                                      text: "Interviews",
                                      size: 20,
                                      fweight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Contain(
                                  height: 30,
                                  //   width: 90,
                                  //  width: MediaQuery.of(context).size.width,
                                  outlinecolor: AppColors.grey,
                                  borderrad: 3,
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        upcomingInterviewdd = value;
                                      });
                                    },
                                    value: upcomingInterviewdd,

                                    // Hide the default underline
                                    underline: SizedBox(),

                                    isExpanded: true,

                                    // The list of options
                                    items: upcomingInterviewItems
                                        .map((e) => DropdownMenuItem(
                                              child: Container(
                                                child: Text(
                                                  e,
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                              ),
                                              value: e,
                                            ))
                                        .toList(),

                                    // Customize the selected item
                                    selectedItemBuilder:
                                        (BuildContext context) =>
                                            upcomingInterviewItems
                                                .map((e) => Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        e,
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey),
                                                      ),
                                                    ))
                                                .toList(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      borderrad: 5,
                      outlinecolor: AppColors.grey,
                      //  backcolor: AppColors.purple,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Textt(
                                  text: "Job Application",
                                  size: 20,
                                  fweight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: DefaultTabController(
                                    length: 2,
                                    child: TabBar(
                                      labelColor: Color(0xFF00E5FF),
                                      indicatorColor: Color(0xFF00E5FF),
                                      unselectedLabelColor: Colors.black,
                                      labelStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      tabs: <Widget>[
                                        Tab(
                                          text: "Day",
                                        ),
                                        Tab(text: "Month"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      borderrad: 5,
                      outlinecolor: AppColors.grey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Textt(
                                text: "Active Job Tracking",
                                size: 20,
                                fweight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      borderrad: 5,
                      outlinecolor: AppColors.grey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Textt(
                                    text: "Call Logs",
                                    size: 20,
                                    fweight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: DefaultTabController(
                                    length: 3,
                                    child: TabBar(
                                      labelColor: Color(0xFF00E5FF),
                                      indicatorColor: Color(0xFF00E5FF),
                                      unselectedLabelColor: Colors.black,
                                      labelStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      tabs: <Widget>[
                                        Text(
                                          "Day",
                                          textScaleFactor: 0.7,
                                        ),
                                        Text(
                                          "Month",
                                          textScaleFactor: 0.7,
                                        ),
                                        DropdownButton<String>(
                                          onChanged: (value) {
                                            setState(() {
                                              callLogsdd = value;
                                            });
                                          },
                                          value: callLogsdd,

                                          underline: SizedBox(),

                                          isExpanded: true,

                                          // The list of options
                                          items: callLogsItems
                                              .map((e) => DropdownMenuItem(
                                                    child: Container(
                                                      child: Text(
                                                        e,
                                                        textScaleFactor: 1.4,
                                                        style: TextStyle(
                                                            fontSize: 13),
                                                      ),
                                                    ),
                                                    value: e,
                                                  ))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Contain(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      borderrad: 5,
                      outlinecolor: AppColors.grey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Textt(
                                  text: "Job Application Read",
                                  size: 20,
                                  fweight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                    labelColor: Color(0xFF00E5FF),
                                    indicatorColor: Color(0xFF00E5FF),
                                    unselectedLabelColor: Colors.black,
                                    labelStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    tabs: <Widget>[
                                      Text(
                                        "By Day",
                                        textScaleFactor: 0.8,
                                      ),
                                      Text(
                                        "By User",
                                        textScaleFactor: 0.8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<AllUserLogBloc, AllUserLogState>(
                        builder: (context, state) {
                      if (state is AllUserLogInitialState) {
                        context
                            .bloc<AllUserLogBloc>()
                            .add(AllUserLogDropdown());

                        return SizedBox(height: 10, child: Loader());
                      } else if (state is AllUserLogDropdownState) {
                        print(state.usersList.length);
                        return Contain(
                          width: MediaQuery.of(context).size.width,
                          height: 340,
                          borderrad: 5,
                          outlinecolor: AppColors.grey,
                          //  backcolor: AppColors.purple,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Textt(
                                      text: "Activity",
                                      size: 20,
                                      fweight: FontWeight.bold,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        activitydd = value;
                                      });
                                    },
                                    value: activitydd,

                                    // Hide the default underline
                                    underline: SizedBox(),
                                    hint: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'By Name',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ),

                                    items: state.usersList
                                            .map((e) => DropdownMenuItem(
                                                  child: Container(
                                                    child: Text(
                                                      e.name.toString(),
                                                      textScaleFactor: 1.4,
                                                      style: TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                  value: e.id.toString(),
                                                ))
                                            .toList() ??
                                        [],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ));
      }
      return Contain();
    });
  }
}
