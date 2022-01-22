import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
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

  String activitydd = 'By Name';
  List<String> activityItems = ['By Name', 'Test', '123'];

  String upcomingInterviewdd = "All";

  List<String> upcomingInterviewItems = ['All'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Statistics"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                  //  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Textt(
                          text: "0 Job Opennings",
                          size: 17,
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
                  //  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Textt(
                          text: "0 Candidates",
                          size: 17,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Contain(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  borderrad: 5,
                  outlinecolor: AppColors.grey,
                  //  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Textt(
                            text: "0 Candidates",
                            size: 17,
                          ),
                        ),
                      )),
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
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ),
                                          value: e,
                                        ))
                                    .toList(),

                                // Customize the selected item
                                selectedItemBuilder: (BuildContext context) =>
                                    upcomingInterviewItems
                                        .map((e) => Align(
                                              alignment: Alignment.centerLeft,
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
                  //  backcolor: AppColors.purple,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textt(
                              text: "Call Logs",
                              size: 20,
                              fweight: FontWeight.bold,
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
                                    // Tab(text: "Month",),
                                    DropdownButton<String>(
                                      onChanged: (value) {
                                        setState(() {
                                          callLogsdd = value;
                                        });
                                      },
                                      value: callLogsdd,

                                      // Hide the default underline
                                      underline: SizedBox(),
                                      // hint: Align(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text(
                                      //     'Select Experience',
                                      //     style: TextStyle(fontSize: 13, color: Colors.grey),
                                      //   ),
                                      // ),

                                      isExpanded: true,

                                      // The list of options
                                      items: callLogsItems
                                          .map((e) => DropdownMenuItem(
                                                child: Container(
                                                  child: Text(
                                                    e,
                                                    textScaleFactor: 1.4,
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
                                              callLogsItems
                                                  .map((e) => Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                          e,
                                                          textScaleFactor: 0.8,
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.grey),
                                                        ),
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
                              text: "Job Application Read",
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
                            // hint: Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(
                            //     'Select Experience',
                            //     style: TextStyle(fontSize: 13, color: Colors.grey),
                            //   ),
                            // ),

                            //  isExpanded: true,

                            // The list of options
                            items: activityItems
                                .map((e) => DropdownMenuItem(
                                      child: Container(
                                        child: Text(
                                          e,
                                          textScaleFactor: 1.4,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      value: e,
                                    ))
                                .toList(),

                            // Customize the selected item
                            selectedItemBuilder: (BuildContext context) =>
                                activityItems
                                    .map((e) => Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            e,
                                            //    textScaleFactor: 0.8,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey),
                                          ),
                                        ))
                                    .toList(),
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
              ],
            ),
          ),
        ));
  }
}
