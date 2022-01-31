// ignore_for_file: deprecated_member_use, missing_return

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_bloc.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_events.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_state.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_bloc.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_event.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_state.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_bloc.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_event.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:flutter_product_recruit/screens/statistics/ai_analytics.dart';
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
  String callLogsdd;
  // List<String> callLogsItems = ['User', 'Test'];
  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.indigo,
    Colors.green,
  ];
  //List<charts.Series<Pollution, String>> _seriesData;

  String activitydd;

  String upcomingInterviewdd = "All";

  List<String> upcomingInterviewItems = ['All'];

  // @override
  // void initState() {
  //   super.initState();
  //   _generateData();
  // }

  // _generateData() {
  //   var data1 = [
  //     new Pollution(1980, 'USA', 30),
  //     new Pollution(1980, 'Asia', 40),
  //     new Pollution(1980, 'Europe', 10),
  //   ];
  //   var data2 = [
  //     new Pollution(1985, 'USA', 100),
  //     new Pollution(1980, 'Asia', 150),
  //     new Pollution(1985, 'Europe', 80),
  //   ];
  //   var data3 = [
  //     new Pollution(1985, 'USA', 200),
  //     new Pollution(1980, 'Asia', 300),
  //     new Pollution(1985, 'Europe', 180),
  //   ];
  //   _seriesData.add(
  //     charts.Series(
  //       domainFn: (Pollution pollution, _) => pollution.place,
  //       measureFn: (Pollution pollution, _) => pollution.quantity,
  //       id: '2017',
  //       data: data1,
  //       fillPatternFn: (_, __) => charts.FillPatternType.solid,
  //       fillColorFn: (Pollution pollution, _) =>
  //           charts.ColorUtil.fromDartColor(Colors.blue),
  //     ),
  //   );
  //   _seriesData.add(
  //     charts.Series(
  //       domainFn: (Pollution pollution, _) => pollution.place,
  //       measureFn: (Pollution pollution, _) => pollution.quantity,
  //       id: '2018',
  //       data: data2,
  //       fillPatternFn: (_, __) => charts.FillPatternType.solid,
  //       fillColorFn: (Pollution pollution, _) =>
  //           charts.ColorUtil.fromDartColor(Color(0xff109618)),
  //     ),
  //   );

  //   _seriesData.add(
  //     charts.Series(
  //       domainFn: (Pollution pollution, _) => pollution.place,
  //       measureFn: (Pollution pollution, _) => pollution.quantity,
  //       id: '2019',
  //       data: data3,
  //       fillPatternFn: (_, __) => charts.FillPatternType.solid,
  //       fillColorFn: (Pollution pollution, _) =>
  //           charts.ColorUtil.fromDartColor(Color(0xffff9900)),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print("entered in build");
    List<UserListsModel> list1 = [];

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
              title: const Text(
                "Statistics",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: IconThemeData(color: AppColors.Black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Image.asset("assets/icons/jobanalytic.svg"),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AIAnalytics()));
                  },
                ),
                // add more IconButton
              ],
            ),
            //   : Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Image.asset("assets/icons/jobanalytic.svg")),
            // ),
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[0].jobApplicantsTagNew}  New",
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[1].shortlist} Shortlist",
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[2].interview}  Interview",
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
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3.0),
                                            child: Textt(
                                              text:
                                                  "${state.applicationStatusList[3].jobApplicantsTags[3].hired}  Hired",
                                              size: 17,
                                            ),
                                          ),
                                        )),
                                  ),
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[4].hold} Hold",
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[5].reject}  Reject",
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[6].firstRound} First",
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
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3.0),
                                            child: Textt(
                                              text:
                                                  "${state.applicationStatusList[3].jobApplicantsTags[7].secondRound} Second",
                                              size: 17,
                                            ),
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Text(""),
                                  )
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[8].thirdRound} Third",
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[9].offerSent}  Offer",
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
                                            text:
                                                "${state.applicationStatusList[3].jobApplicantsTags[10].accepted} Accepted",
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
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3.0),
                                            child: Textt(
                                              text:
                                                  "${state.applicationStatusList[3].jobApplicantsTags[11].joined}  Joined",
                                              size: 17,
                                            ),
                                          ),
                                        )),
                                  ),
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
                              // Expanded(
                              //   child: charts.BarChart(
                              //     _seriesData,
                              //     animate: true,
                              //     barGroupingType:
                              //         charts.BarGroupingType.grouped,
                              //     //behaviors: [new charts.SeriesLegend()],
                              //     animationDuration: Duration(seconds: 5),
                              //   ),
                              // ),
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
                          BlocBuilder<JobListBloc, JobListState>(
                              builder: (context, state) {
                            if (state is JobListInitialState) {
                              context
                                  .bloc<JobListBloc>()
                                  .add(JobListInitialEvent());
                              return SizedBox(height: 35, child: Loader());
                            } else if (state is GetJobListState) {
                              //  print("statessss----$state");
                              print(state.jobLists.length);
                              return Container(
                                  height: 200,
                                  child: Wrap(
                                    //   runAlignment: WrapAlignment.start,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    spacing: 8.0, // gap between adjacent chips
                                    //  runSpacing: 4.0, // gap between lines
                                    children: [
                                      for (var i = 0;
                                          i < state.jobLists.length;
                                          i++)
                                        Text.rich(
                                          TextSpan(
                                            children: <InlineSpan>[
                                              WidgetSpan(
                                                alignment:
                                                    PlaceholderAlignment.middle,
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.primaries[
                                                          Random().nextInt(
                                                              Colors.primaries
                                                                  .length)]),
                                                  child: Text(""),
                                                ),
                                              ),
                                              TextSpan(
                                                  text:
                                                      "  ${state.jobLists[i].title}"),
                                            ],
                                          ),
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 13),
                                        )
                                    ],
                                  ));
                            } else
                              return Container();
                          }),
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
                    BlocBuilder<AllUserLogBloc, AllUserLogState>(
                        builder: (context, state) {
                      if (state is AllUserLogInitialState) {
                        context
                            .bloc<AllUserLogBloc>()
                            .add(AllUserLogDropdown());

                        return SizedBox(height: 10, child: Loader());
                      } else if (state is AllUserLogDropdownState) {
                        for (final hrList in state.usersList) {
                          if (hrList.userType == "HR") {
                            list1.add(hrList);
                            // print(list1.length);
                          }
                        }
                        return Column(
                          children: [
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
                                        flex: 4,
                                        child: Container(
                                          child: DefaultTabController(
                                            length: 3,
                                            child: TabBar(
                                              labelColor: Color(0xFF00E5FF),
                                              indicatorColor: Color(0xFF00E5FF),
                                              unselectedLabelColor:
                                                  Colors.black,
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
                                                  isExpanded: true,

                                                  // Hide the default underline
                                                  underline: SizedBox(),
                                                  hint: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'User',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),

                                                  items: list1
                                                          .map((e) =>
                                                              DropdownMenuItem(
                                                                child:
                                                                    Container(
                                                                  child: Text(
                                                                    e.name
                                                                        .toString(),
                                                                    textScaleFactor:
                                                                        1.4,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13),
                                                                  ),
                                                                ),
                                                                value: e.id
                                                                    .toString(),
                                                              ))
                                                          .toList() ??
                                                      [],
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
                                                fontSize: 13,
                                                color: Colors.grey),
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
                            ),
                          ],
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

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}
