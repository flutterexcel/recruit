// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/add_source.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class ManageSources extends StatefulWidget {
  ManageSources();
  @override
  _ManageSourcesState createState() => _ManageSourcesState();
}

class _ManageSourcesState extends State<ManageSources> {
  String dropdownvalue = 'New Mails';

  // List of items in our dropdown menu
  var items = [
    'New Mails',
    'Old Mails',
  ];
  _ManageSourcesState();
  @override
  Widget build(BuildContext context) {
    // print("manage source -${state}");

    void OnPressed() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddSource()));
    }

    return Scaffold(
      drawer: NavigationList(),
      appBar: SecondAppBar(
          text: "Add Source", title: "Manage Sources", onPressed: OnPressed),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Contain(
                width: MediaQuery.of(context).size.width,
                height: 280,
                borderrad: 5,
                outlinecolor: AppColors.grey,
                child: Column(
                  children: [
                    Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                      Container(
                        height: 170,
                        width: double.infinity,
                        color: AppColors.Green,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("test@gmail.com"),
                                    Text("18 hours ago"),
                                  ],
                                ),
                                Text("82/88 (21 jan-31-apr)"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //width: 260,
                        height: 10,
                        color: AppColors.orange12,
                      ),
                      Container(
                        //width: 260,
                        height: 21,
                        color: AppColors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/gmaill.png'),
                          radius: 28,
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Icon(Icons.remove),
                          const SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.refresh),
                          const SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.power),
                          const SizedBox(
                            width: 6,
                          ),
                          Icon(Icons.email_outlined),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
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
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textt(
                              text: "Email Fetched",
                              size: 18,
                              fweight: FontWeight.bold,
                            ),
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
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                tabs: <Widget>[
                                  Text(
                                    "Day",
                                    textScaleFactor: 0.7,
                                  ),
                                  Text(
                                    "Month",
                                    textScaleFactor: 0.7,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,

                                      value: dropdownvalue,

                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownvalue = newValue;
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
