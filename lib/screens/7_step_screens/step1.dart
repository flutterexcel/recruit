import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step2.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

// ignore: must_be_immutable
class Step1 extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        // drawer: NavigationList(),s
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.purple,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          child: const Text(
                        "Follow this stepwise process to setup a job",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 420,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Step 1/7",
                              style: TextStyle(fontSize: 10),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "These are the sources you already have added.If you want to add more,follow below we collect candidates for the source which you configure.",
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 200,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: AppColors.lightGrey,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/naukri.png'),
                                      radius: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          child: const Text(
                                        "Connected to naukri.",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ))),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 75,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Container(
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: AppColors.orange12,
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: FlatButton(
                                      child: const Text(
                                        "Add Source",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Container(
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      color: AppColors.blue,
                                      shape: BoxShape.rectangle,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
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
                                                builder: (context) => Step2()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
