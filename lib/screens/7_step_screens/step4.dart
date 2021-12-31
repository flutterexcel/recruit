import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

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
                  child: Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
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
                            "Manage Job Roles!",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Step 4/7",
                            style: TextStyle(fontSize: 10),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                          Row(
                            children: const [
                              Text(
                                "Assign ",
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                "user ",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.orange),
                              ),
                              Text(
                                "who would be working on this job profile",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 1,
                          ),

                          Text(
                            "by default all users are assigned to a job profile",
                            style: TextStyle(fontSize: 13),
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          Container(
                            height: 310,
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "HRs",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  for (int i = 0; i < 4; i++)
                                    Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 140,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.orange12),
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                const BorderRadius.all(
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

                          Container(
                            height: 100,
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(27.0),
                              child: Text(
                                "Interviewee",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

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
                                            builder: (context) => Step3()));
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
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
