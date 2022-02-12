// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/jobtitle/removeallcandidatesdialouge.dart';

// ignore: camel_case_types, must_be_immutable
class ActivateConfirmDialouge extends StatelessWidget {
  String id;
  ActivateConfirmDialouge({this.id});
  void _popupFetchFromDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: RemoveOldCandidatesDialouge(
            id: id,
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 170,
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
                'Are you sure want to activate this Job Profile??',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'No',
                  style: TextStyle(fontSize: 13),
                ),
                FlatButton(
                    height: 40,
                    minWidth: 6,
                    color: AppColors.Orange,
                    child: Text(
                      'Yes',
                      style: TextStyle(fontSize: 13),
                    ),
                    textColor: Colors.white,
                    onPressed: () {
                      _popupFetchFromDialog(context, id);
                      // Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
