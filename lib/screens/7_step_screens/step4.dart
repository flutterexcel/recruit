import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/step3.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Step4 extends StatelessWidget {
  final List<String> names = <String>['govind', 'text', 'Test', 'test123'];
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
                          text: "Manage Job Roles!",
                          size: 20,
                          fweight: FontWeight.bold,
                        ),
                        Textt(
                          text: "Step 4/7",
                          size: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                        Row(
                          children: [
                            Textt(
                              text: "Assign ",
                              size: 13,
                            ),
                            Textt(
                              text: "user ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                            Textt(
                              text: "who would be working on this job profile",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),
                        Textt(
                          text:
                              "by default all users are assigned to a job profile",
                          size: 13,
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        Contain(
                          height: 310,
                          width: 250,
                          outlinecolor: AppColors.grey,
                          borderrad: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textt(
                                  text: "HRs",
                                  size: 13,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                for (int i = 0; i < 4; i++)
                                  Column(
                                    children: [
                                      Container(
                                        // constraints: BoxConstraints(
                                        //     minWidth: 100, maxWidth: 200),
                                        // height: 40,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.orange12),
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    'assets/images/default.png'),
                                                radius: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(names[i]),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Contain(
                          height: 100,
                          width: 250,
                          outlinecolor: AppColors.grey,
                          borderrad: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(27.0),
                            child: Textt(
                              text: "Interviwee",
                              tcolor: AppColors.grey,
                            ),
                          ),
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
                                    builder: (context) => Step3()));
                              },
                            ),
                            Buttonn(
                              text: "Next",
                              bgcolor: AppColors.blue,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step5()));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
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
