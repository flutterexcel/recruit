import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Step7 extends StatefulWidget {
  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  String _firstRound;
  String _secondRound;
  String _thirdRound;

  List<String> items = [
    'No Tests',
  ];

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
                          text: "Interview Test",
                          size: 20,
                          fweight: FontWeight.bold,
                        ),
                        Textt(
                          text: "Step 7/7",
                          size: 10,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                        Row(
                          children: [
                            Textt(
                              text: "Setup ",
                              size: 13,
                            ),
                            Textt(
                              text: "online test ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                            Textt(
                              text: "objective or subjective to interview",
                              size: 13,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),
                        Textt(
                          text: "rounds",
                          size: 13,
                        ),

                        const SizedBox(
                          height: 1,
                        ),

                        Row(
                          children: [
                            Textt(
                              text: "These tests need to already setup in the ",
                              size: 13,
                            ),
                            Textt(
                              text: "Interview ",
                              size: 13,
                              tcolor: AppColors.orange12,
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 1,
                        ),
                        Textt(
                          text: "system",
                          size: 13,
                          tcolor: AppColors.orange12,
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        Row(
                          children: [
                            Text(
                              'Create a new test',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.grey),
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Text(
                              'Refresh tests',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.grey),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        Row(
                          children: [
                            Contain(
                              height: 50,
                              width: 170,
                              //outlinecolor: AppColors.grey,
                              backcolor: AppColors.purple,
                              borderrad: 6,
                              child: Center(
                                child: Textt(
                                  text: "First Round",
                                  tcolor: AppColors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: 150,
                                height: 40,
                                child: Contain(
                                  outlinecolor: AppColors.grey,
                                  borderrad: 1,
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        _firstRound = value;
                                      });
                                    },
                                    value: _firstRound,

                                    // Hide the default underline
                                    underline: SizedBox(),

                                    isExpanded: true,

                                    // The list of options
                                    items: items
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
                                        (BuildContext context) => items
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Contain(
                              height: 50,
                              width: 170,
                              //outlinecolor: AppColors.grey,
                              backcolor: AppColors.purple_opacity,
                              borderrad: 6,
                              child: Center(
                                child: Textt(
                                  text: "Second Round",
                                  tcolor: AppColors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: 150,
                                height: 40,
                                child: Contain(
                                  outlinecolor: AppColors.grey,
                                  borderrad: 1,
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        _secondRound = value;
                                      });
                                    },
                                    value: _secondRound,

                                    // Hide the default underline
                                    underline: SizedBox(),

                                    isExpanded: true,

                                    // The list of options
                                    items: items
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
                                        (BuildContext context) => items
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Contain(
                              height: 50,
                              width: 170,
                              //outlinecolor: AppColors.grey,
                              backcolor: AppColors.purple_opacity_min,
                              borderrad: 6,
                              child: Center(
                                child: Textt(
                                  text: "Third Round",
                                  tcolor: AppColors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: SizedBox(
                                width: 150,
                                height: 40,
                                child: Contain(
                                  outlinecolor: AppColors.grey,
                                  borderrad: 1,
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      setState(() {
                                        _thirdRound = value;
                                      });
                                    },
                                    value: _thirdRound,

                                    // Hide the default underline
                                    underline: SizedBox(),

                                    isExpanded: true,

                                    // The list of options
                                    items: items
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
                                        (BuildContext context) => items
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
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Buttonn(
                              text: "Skip",
                              bgcolor: AppColors.grey,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Step1()));
                              },
                            ),
                            Buttonn(
                              text: "Finish",
                              bgcolor: AppColors.blue,
                              borderRadius: 2,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyAccount()));
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
}
