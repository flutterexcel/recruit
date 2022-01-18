import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/add_source.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class ManageSources extends StatefulWidget {
  ManageSources();
  @override
  _ManageSourcesState createState() => _ManageSourcesState();
}

class _ManageSourcesState extends State<ManageSources> {
  _ManageSourcesState();
  String _selectedExperience = 'New Mails';
  List<String> items = ['New Mails', 'Old Mails'];

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Contain(
          width: MediaQuery.of(context).size.width,
          height: 300,
          borderrad: 5,
          //  backcolor: AppColors.purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Textt(
                    text: "Email Fetched",
                    size: 25,
                    fweight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelColor: Color(0xFF00E5FF),
                    indicatorColor: Color(0xFF00E5FF),
                    unselectedLabelColor: Colors.black,
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    tabs: <Widget>[
                      Tab(
                        text: "Day",
                      ),
                      Tab(text: "Month"),
                      DropdownButton<String>(
                        onChanged: (value) {
                          setState(() {
                            _selectedExperience = value;
                          });
                        },
                        value: _selectedExperience,

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
                        items: items
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
                        selectedItemBuilder: (BuildContext context) => items
                            .map((e) => Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    e,
                                    textScaleFactor: 1.3,
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
