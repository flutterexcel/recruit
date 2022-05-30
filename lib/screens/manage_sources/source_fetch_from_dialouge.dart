// ignore_for_file: must_be_immutable, deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';
import 'package:flutter_product_recruit/widgets/container.dart';

class SourceFetchFromDialouge extends StatefulWidget {
  @override
  State<SourceFetchFromDialouge> createState() =>
      _SourceFetchFromDialougeState();
}

class _SourceFetchFromDialougeState extends State<SourceFetchFromDialouge> {
  final _formKey = GlobalKey<FormState>();
  String _selectRange;
  List<String> items = [
    'Last Week',
    'Late 2 Week',
    'Last Month',
    'Last 2 Month',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Fetch Mails',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontFamily: 'RobotRegular',
                  ),
                  //   textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Select date range below it will start fetching fromm selected date range',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'RobotRegular',
                    color: AppColors.grey,
                  ),
                  //  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Select Date Range',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontFamily: 'RobotRegular',
                  ),
                  //  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 6,
                ),
                Contain(
                  outlinecolor: AppColors.grey,
                  borderrad: 10,
                  child: DropdownButton<String>(
                    onChanged: (value) {
                      setState(() {
                        _selectRange = value;
                      });
                    },
                    value: _selectRange,
                    underline: SizedBox(),
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Domain',
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
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                height: 35,
                // minWidth: 2,
                color: AppColors.Orange,
                child: Text(
                  'Fetch',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Step4()));
                }),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
