// ignore_for_file: must_be_immutable, deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/jobs_overview_bloc/jobs_overview_bloc.dart';

import 'package:flutter_product_recruit/services/jobs_overview/job_deactivate_service.dart';

import 'package:intl/intl.dart';

// ignore: camel_case_types

class OpenJobProfileDialouge extends StatefulWidget {
  String id;
  OpenJobProfileDialouge({this.id});
  @override
  State<OpenJobProfileDialouge> createState() => _OpenJobProfileDialougeState();
}

class _OpenJobProfileDialougeState extends State<OpenJobProfileDialouge> {
  // TextEditingController textEditingController = new TextEditingController();
  TextEditingController dateinput = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String formattedDate;
  String nowDate = DateFormat("yyyy-dd-MM").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 370,
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
                  'Open Job Profile',
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
                  'When a job profile is closed, even if candidate continue to apply to a job profile they are not added to the job profile.Since you are opening a closed job profile now, you can optionally select if we should add any old candidate to the job profile again!Select a date, if any candidate has applied to the same job after that date they will be added to this job profile!',
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
                Row(
                  children: [
                    Text(
                      'Fetch From',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 15,
                        fontFamily: 'RobotRegular',
                      ),
                      //  textDirection: TextDirection.ltr,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        '(you can leave this empty, this is optional!)',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 10,
                          fontFamily: 'RobotRegular',
                        ),
                        //  textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
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
                            formattedDate =
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
                  'Open',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () async {
                  print(widget.id);

                  JobDeactivationModel res =
                      await DeactivateJobService.deactivateJob(
                          formattedDate, widget.id, true, nowDate);

                  if (res.status == 1) {
                    //   Navigator.pop(context);
                    Utils.showSnackBar(
                        context, "Succesfully Activated", AppColors.Green);
                    context
                        .bloc<JobsOverviewBlocBloc>()
                        .add(JobsOverviewInitial());
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             JobsOverview()));
                  } else {
                    Utils.showSnackBar(context, "Invalid Id", AppColors.Red);
                  }
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
