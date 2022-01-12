// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';

class Add_Source extends StatefulWidget {
  TextEditingController textEditingController;
  Add_Source({this.textEditingController});

  @override
  State<Add_Source> createState() => _Add_SourceState();
}

class _Add_SourceState extends State<Add_Source> {
  String _selectedPutAfter;
  String _selectedInhertedFrom;

  List<String> items = [
    'New',
    'Shortlist',
    'Interview',
    'Hired',
    'Hold',
    'Reject',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 360,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Source Matching',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Pipeline Name',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 5,
              ),
              TextInput(
                autocorrect: true,
                hintText: "Stage",
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton<String>(
                onChanged: (value) {
                  setState(() {
                    _selectedPutAfter = value;
                  });
                },
                value: _selectedPutAfter,

                // Hide the default underline
                //    underline: SizedBox(),
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Put After',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),

                isExpanded: true,

                // The list of options
                items: items
                    .map((e) => DropdownMenuItem(
                          child: Container(
                            child: Text(
                              e,
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
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton<String>(
                onChanged: (value) {
                  setState(() {
                    _selectedInhertedFrom = value;
                  });
                },
                value: _selectedInhertedFrom,

                // Hide the default underline
                //    underline: SizedBox(),
                hint: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Inherited From',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),

                isExpanded: true,

                // The list of options
                items: items
                    .map((e) => DropdownMenuItem(
                          child: Container(
                            child: Text(
                              e,
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
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                height: 40,
                minWidth: 6,
                color: AppColors.Orange,
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
