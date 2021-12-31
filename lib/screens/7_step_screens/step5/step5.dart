import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/dob_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/education_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/experience_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/gender_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/location_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/passout_year_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/skills_widget.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

// ignore: must_be_immutable
class Step5 extends StatelessWidget {
  final List<String> names = <String>['govind', 'text', 'Test', 'test123'];
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 12.0, right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Automated Resume Scoring",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Step 5/7",
                            style: TextStyle(fontSize: 10),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                          Row(
                            children: const [
                              Text(
                                "Specify your ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "criteria ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.orange),
                              ),
                              Text(
                                "for candidate shortlisting.",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 1,
                          ),

                          Row(
                            children: const [
                              Text(
                                "Our ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "AI ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.orange),
                              ),
                              Text(
                                "system will automatically score resumes for you",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 1,
                          ),

                          Row(
                            children: const [
                              Text(
                                "based on these criteria and help you with much ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "faster ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.orange),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 1,
                          ),

                          Text(
                            "shortlisting",
                            style:
                                TextStyle(fontSize: 13, color: Colors.orange),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          Row(
                            children: const [
                              Text(
                                "I am looking for a candidate",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Basic ",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Switch(
                                value: true,
                                activeTrackColor: const Color(0xFFf6a609),
                                activeColor: const Color(0xFFf6a609),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Skills(),

                          const SizedBox(
                            height: 20,
                          ),

                          Exp(),
                          const SizedBox(
                            height: 20,
                          ),

                          Edu(),

                          const SizedBox(
                            height: 20,
                          ),

                          Gender(),

                          const SizedBox(
                            height: 20,
                          ),

                          Passout(),

                          const SizedBox(
                            height: 20,
                          ),

                          Location(),

                          const SizedBox(
                            height: 20,
                          ),

                          Dob(),

                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: FlatButton(
                                  child: const Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Step4()));
                                  },
                                ),
                              ),
                              Container(
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: AppColors.blue,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                                child: FlatButton(
                                  child: const Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Step5()));
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "*specify at least 4 skills as skills field is mandatory",
                              style: TextStyle(fontSize: 11, color: Colors.red),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
