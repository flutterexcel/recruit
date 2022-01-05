import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_dob_widget_advance.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_education_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_experience_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_gender_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_location_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_passout_year_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/advance_widgets/advance_skills_widget.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step6/step6.dart';

import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

import 'basic_widgets/dob_widget.dart';
import 'basic_widgets/education_widget.dart';
import 'basic_widgets/experience_widget.dart';
import 'basic_widgets/gender_widget.dart';
import 'basic_widgets/location_widget.dart';
import 'basic_widgets/passout_year_widget.dart';
import 'basic_widgets/skills_widget.dart';

// ignore: must_be_immutable
class Step5 extends StatefulWidget {
  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final List<String> names = <String>['govind', 'text', 'Test', 'test123'];

  bool isSwitched = true;

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
                child: Contain(
                  outlinecolor: AppColors.grey,
                  borderrad: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textt(
                          text: "Automated Resume Scoring",
                          size: 20,
                          fweight: FontWeight.bold,
                        ),
                        Textt(
                          text: "Step 5/7",
                          size: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                        Row(
                          children: [
                            Textt(
                              text: "Specify your ",
                              size: 13,
                            ),
                            Textt(
                              text: "criteria ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                            Textt(
                              text: "for candidate shortlisting.",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),

                        Row(
                          children: [
                            Textt(
                              text: "our ",
                              size: 13,
                            ),
                            Textt(
                                text: "AI ",
                                size: 13,
                                tcolor: AppColors.orange12),
                            Textt(
                              text:
                                  "system will automatically score resumes for you",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),

                        Row(
                          children: [
                            Textt(
                              text:
                                  "based on these criteria and help you with much ",
                              size: 13,
                            ),
                            Textt(
                              text: "faster ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),
                        Textt(
                          text: "shortlisting",
                          size: 13,
                          tcolor: AppColors.orange12,
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          children: [
                            Textt(
                              text: "I am looking for a candidate",
                              size: 11,
                              tcolor: AppColors.grey,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Textt(
                              text: isSwitched ? "Basic" : "Advanced",
                              size: 11,
                              tcolor: AppColors.grey,
                              fstyle: FontStyle.italic,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Switch(
                              value: isSwitched,
                              activeTrackColor: const Color(0xFFf6a609),
                              activeColor: const Color(0xFFf6a609),
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = !isSwitched;
                                });
                              },
                            ),
                          ],
                        ),

                        isSwitched
                            ? Column(
                                children: [
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
                                ],
                              )
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Skills(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Exp(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Edu(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Gender(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Passout(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Location(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Adv_Dob(),
                                ],
                              ),

                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Buttonn(
                              text: "Back",
                              bgcolor: AppColors.grey,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step4()));
                              },
                            ),
                            Buttonn(
                              text: "Next",
                              bgcolor: AppColors.blue,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step6()));
                              },
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: Textt(
                            text:
                                "*specify at least 4 skills as skills field is mandatory",
                            size: 11,
                            tcolor: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
