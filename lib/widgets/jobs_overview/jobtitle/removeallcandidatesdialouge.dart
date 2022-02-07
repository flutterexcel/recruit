// ignore_for_file: must_be_immutable, deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/jobtitle/openjobprofiledialouge.dart';

class RemoveOldCandidatesDialouge extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String id;
  RemoveOldCandidatesDialouge({this.id});

  void _popupFetchFromDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: OpenJobProfileDialouge(
            id: id,
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 210,
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
                  'Remove Old Candidates',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your job profile is opening, but there are already candidates in this job profile. Do you wish to start fresh or keep it as it is?',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'RobotRegular',
                    color: AppColors.grey,
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 13),
                  ),
                  onTap: () {
                    _popupFetchFromDialog(context, id);
                    // Navigator.pop(context);
                  },
                ),
                FlatButton(
                    height: 40,
                    minWidth: 6,
                    color: AppColors.Orange,
                    child: Text(
                      'Fresh',
                      style: TextStyle(fontSize: 13),
                    ),
                    textColor: Colors.white,
                    onPressed: () {}),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
