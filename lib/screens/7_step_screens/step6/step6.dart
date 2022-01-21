import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step6/add_dialouge.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step6/source_matching_dialouge.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step7.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class Step6 extends StatefulWidget {
  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  TextEditingController tfController = TextEditingController();
  bool isPressed = true;

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Source_Matching());
        });
  }

  void _popupAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Add_Source());
        });
  }

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
                  outlinecolor: Colors.black,
                  borderrad: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 12.0, right: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textt(
                          text: "Candidate PipeLine",
                          size: 20,
                          fweight: FontWeight.bold,
                        ),
                        Textt(
                          text: "Step 6/7",
                          size: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                        Row(
                          children: [
                            Textt(
                              text: "Define your ",
                              size: 13,
                            ),
                            Textt(
                              text: "custom ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                            Textt(
                              text: "pipeline for this job",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        containerr(AppColors.blue, "New"),

                        const SizedBox(
                          height: 30,
                        ),

                        containerr(AppColors.orange12, "Shortlist"),

                        const SizedBox(
                          height: 30,
                        ),

                        containerr(AppColors.purple, "Interview"),

                        const SizedBox(
                          height: 30,
                        ),

                        Align(
                            alignment: Alignment.bottomRight,
                            child: containerr(AppColors.purple, "First Round")),

                        const SizedBox(
                          height: 30,
                        ),

                        Align(
                            alignment: Alignment.bottomRight,
                            child: containerr(
                                AppColors.purple_opacity, "Second Round")),

                        const SizedBox(
                          height: 30,
                        ),

                        Align(
                            alignment: Alignment.bottomRight,
                            child: containerr(
                                AppColors.purple_opacity_min, "Third Round")),

                        const SizedBox(
                          height: 30,
                        ),

                        containerr(AppColors.Green, "Hired"),

                        const SizedBox(
                          height: 30,
                        ),

                        Align(
                            alignment: Alignment.bottomRight,
                            child: containerr(AppColors.Green, "Offer Sent")),

                        const SizedBox(
                          height: 30,
                        ),

                        Align(
                            alignment: Alignment.bottomRight,
                            child: containerr(
                                AppColors.Green_opacity, "Accepted")),

                        const SizedBox(
                          height: 30,
                        ),

                        Align(
                            alignment: Alignment.bottomRight,
                            child: containerr(
                                AppColors.Green_opacity_min, "Joined")),

                        const SizedBox(
                          height: 30,
                        ),

                        containerr(AppColors.grey, "Hold"),

                        const SizedBox(
                          height: 30,
                        ),

                        containerr(AppColors.Red, "Reject"),

                        const SizedBox(
                          height: 30,
                        ),

                        Contain(
                          height: 50,
                          width: 200,
                          //outlinecolor: AppColors.grey,

                          borderrad: 6,
                          child: Center(
                            child: Transform.scale(
                              scale: 1.5,
                              child: InkWell(
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.grey,
                                ),
                                onTap: () {
                                  _popupAddDialog(context);
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 30,
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
                                    builder: (context) => Step5()));
                              },
                            ),
                            Buttonn(
                              text: "Next",
                              bgcolor: AppColors.blue,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step7()));
                              },
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
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

  Widget containerr(final bg_color, String text) {
    return Contain(
      height: 50,
      width: 200,
      //outlinecolor: AppColors.grey,
      backcolor: bg_color,
      borderrad: 6,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Textt(
                text: text,
                tcolor: AppColors.white,
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.stream,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isPressed = false;
                    });
                  },
                ),
                if (text.contains('First Round') ||
                    text.contains('Second Round') ||
                    text.contains('Third Round') ||
                    text.contains('Offer Sent') ||
                    text.contains('Accepted') ||
                    text.contains('Joined'))
                  SizedBox(
                    width: 1,
                  )
                else
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      _popupDialog(context);
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
