// ignore_for_file: deprecated_member_use, missing_return

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
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
import 'package:flutter_product_recruit/bloc/jobperformance_bloc/jobperformance_bloc.dart';
import 'package:flutter_product_recruit/bloc/jobperformance_bloc/jobperformance_event.dart';
import 'package:flutter_product_recruit/bloc/jobperformance_bloc/jobperformance_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:flutter_product_recruit/screens/statistics/ai_analytics.dart';
import 'package:flutter_product_recruit/screens/statistics/job_applicants.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
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
//  List<charts.Series<Pollution, String>> _seriesData;

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
    List lists2 = [];
    const cutOffYValue = 0.0;
    const yearTextStyle = TextStyle(fontSize: 12, color: Colors.black);

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
                    JobApplicants(state),
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
                      height: 460,
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
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 5,
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
                                  child: Wrap(
                                //   runAlignment: WrapAlignment.start,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
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
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.primaries[
                                                      Random().nextInt(Colors
                                                          .primaries.length)]),
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LineChart(
                                LineChartData(
                                  lineTouchData: LineTouchData(enabled: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 1),
                                      ],
                                      belowBarData: BarAreaData(
                                        // show: true,
                                        colors: [
                                          Colors.lightBlue.withOpacity(0.5)
                                        ],
                                        cutOffY: cutOffYValue,
                                        applyCutOffY: true,
                                      ),
                                      aboveBarData: BarAreaData(
                                        show: true,
                                        colors: [
                                          Colors.lightGreen.withOpacity(0.5)
                                        ],
                                        cutOffY: cutOffYValue,
                                        applyCutOffY: true,
                                      ),
                                      dotData: FlDotData(
                                        show: false,
                                      ),
                                    ),
                                  ],
                                  minY: 0,
                                  maxX: 3,
                                  maxY: 4,
                                  minX: 0,
                                  gridData: FlGridData(
                                      show: true,
                                      getDrawingHorizontalLine: (value) =>
                                          FlLine(strokeWidth: 1)),
                                  titlesData: FlTitlesData(
                                    bottomTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 10,
                                        margin: 15,
                                        textStyle: yearTextStyle,
                                        getTitles: (value) {
                                          switch (value.toInt()) {
                                            case 0:
                                              return 'Mon, Jan 10';
                                            case 1:
                                              return 'Fri, Jan 21';
                                            case 2:
                                              return 'Tue, Feb 1';
                                          }
                                          return '';
                                        }),
                                    leftTitles: SideTitles(
                                      showTitles: true,
                                      margin: 15,
                                      getTitles: (value) {
                                        switch (value.toInt()) {
                                          case 0:
                                            return '0';
                                          case 1:
                                            return '0.25';
                                          case 2:
                                            return '0.5';
                                          case 3:
                                            return '0.75';
                                          case 4:
                                            return '1';
                                          default:
                                            return '';
                                        }
                                      },
                                    ),
                                  ),
                                  // axisTitleData: FlAxisTitleData(
                                  //     leftTitle: AxisTitle(
                                  //         showTitle: true,
                                  //         titleText: 'Value',
                                  //         margin: 10),
                                  //     bottomTitle: AxisTitle(
                                  //         showTitle: true,
                                  //         margin: 10,
                                  //         titleText: 'Year',
                                  //         textStyle: yearTextStyle,
                                  //         textAlign: TextAlign.right)),
                                  // gridData: FlGridData(
                                  //   show: true,
                                  //   checkToShowHorizontalLine: (double value) {
                                  //     return value == 1 ||
                                  //         value == 2 ||
                                  //         value == 3 ||
                                  //         value == 4;
                                  //   },
                                  // ),
                                ),
                              ),
                            ),
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
                              //  height: 340,
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
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  BlocBuilder<JobPerformanceBloc,
                                          JobPerformanceState>(
                                      builder: (context, state) {
                                    if (state is JobPerformanceInitialState) {
                                      print(StorageUtil.getId());
                                      context.bloc<JobPerformanceBloc>().add(
                                          JobPerformanceInitialEvent(
                                              StorageUtil.getId()));
                                      return SizedBox(
                                          height: 5, child: Loader());
                                    } else if (state
                                        is GetJobPerformanceState) {
                                      //  print(state.jobpPerformanceLists[0]);
                                      for (var i = 0;
                                          i <=
                                              state.jobpPerformanceLists.length;
                                          i++) {
                                        for (var j = 0;
                                            j <
                                                state.jobpPerformanceLists[i]
                                                    .length;
                                            j++) {
                                          lists2.add(
                                              state.jobpPerformanceLists[j]);
                                        }
                                      }
                                      print("lists2$lists2");
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Scrollbar(
                                          //controller: _controllerOne,
                                          thickness: 1,
                                          // isAlwaysShown: true,
                                          child: Column(
                                            children: [
                                              // Row(
                                              //     mainAxisAlignment:
                                              //         MainAxisAlignment
                                              //             .spaceBetween,
                                              //     children: [
                                              //       // Padding(
                                              //       //   padding:
                                              //       //       const EdgeInsets.only(
                                              //       //           left: 15),
                                              //       //   child: Text(
                                              //       //     "day",
                                              //       //     style: TextStyle(
                                              //       //         fontSize: 18,
                                              //       //         fontWeight:
                                              //       //             FontWeight.w600),
                                              //       //   ),
                                              //       // ),
                                              //       Padding(
                                              //         padding:
                                              //             const EdgeInsets.only(
                                              //                 right: 15),
                                              //         child: Text(
                                              //           "duration",
                                              //           style: TextStyle(
                                              //               fontSize: 18,
                                              //               fontWeight:
                                              //                   FontWeight.w600),
                                              //         ),
                                              //       ),
                                              //     ]),
                                              Container(
                                                  height: 600,
                                                  padding:
                                                      EdgeInsets.only(top: 25),
                                                  child: ListView.separated(
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                                  int index) =>
                                                              const Divider(),
                                                      // physics: NeverScrollableScrollPhysics(),
                                                      // shrinkWrap: true,
                                                      itemCount: lists2.length,
                                                      // state
                                                      //     .jobpPerformanceLists
                                                      //     .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Row(
                                                          children: [
                                                            Column(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              20),
                                                                  width: 12,
                                                                  height: 12,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xFFFf6a609),
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(80))),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              20),
                                                                  width: 2,
                                                                  height: 70,
                                                                  color: Color(
                                                                      0xFFFf6a609),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      lists2[index]
                                                                          .employee,
                                                                      textScaleFactor:
                                                                          1.3,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Text(
                                                                      "9:56AM - 3:30PM",
                                                                      textScaleFactor:
                                                                          1.3,
                                                                      style: TextStyle(
                                                                          color:
                                                                              AppColors.grey),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Shakshi",
                                                                          textScaleFactor:
                                                                              1.3,
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          " was active for ",
                                                                          textScaleFactor:
                                                                              1.3,
                                                                        ),
                                                                        Text(
                                                                          "1:15",
                                                                          textScaleFactor:
                                                                              1.3,
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ]),
                                                            )
                                                          ],
                                                        );
                                                      }))
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                    return Container();
                                  }),
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
