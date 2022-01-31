// ignore_for_file: must_be_immutable, deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step4.dart';

import 'package:intl/intl.dart';

// ignore: camel_case_types

class FetchFromDialouge extends StatefulWidget {
  @override
  State<FetchFromDialouge> createState() => _FetchFromDialougeState();
}

class _FetchFromDialougeState extends State<FetchFromDialouge> {
  // TextEditingController textEditingController = new TextEditingController();
  TextEditingController dateinput = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 300,
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
                  'Existing Candidate',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontFamily: 'RobotRegular',
                  ),
                  //   textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Would you like to add old candidates in your database matching the job profile to get automatically to this job profile?',
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
                  'Fetch From',
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
                TextField(
                  controller: dateinput,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today

                            // color: Theme.of(context).primaryColorDark,
                            ),
                        onPressed: () async {
                          DateTime pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);

                            setState(() {
                              dateinput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        }),
                  ),

                  readOnly:
                      true, //set it true, so that user will not able to edit text
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
