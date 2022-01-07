import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/add_source.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step2.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

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
                child: Contain(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  borderrad: 5,
                  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Textt(
                          text: "Follow this stepwise process to setup a job",
                          size: 15,
                          tcolor: Colors.white,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  outlinecolor: Colors.black,
                  borderrad: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textt(
                            text: "Welcome Back",
                            size: 20,
                            fweight: FontWeight.bold,
                          ),
                          Textt(
                            text: "Step 1/7",
                            size: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Textt(
                            text:
                                "These are the sources you already have added.If you want to add more,follow below we collect candidates for the source which you configure.",
                            size: 20,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Contain(
                            width: 200,
                            height: 50,
                            backcolor: AppColors.lightGrey,
                            borderrad: 25,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/naukri.png'),
                                    radius: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Textt(
                                        text: "Connected to naukri.",
                                        size: 13,
                                        tcolor: Colors.white,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Buttonn(
                                text: "Add Source",
                                bgcolor: AppColors.orange12,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Add_Source_C()));
                                },
                              ),
                              Buttonn(
                                text: "Next",
                                bgcolor: AppColors.blue,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Step2()));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
