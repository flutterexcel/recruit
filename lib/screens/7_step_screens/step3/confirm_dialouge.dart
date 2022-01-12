import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
=======
import 'package:flutter_product_recruit/app_colors.dart';
>>>>>>> 724fa5013d2bcbfe325f78ffb9e197cce36a230d

// ignore: camel_case_types, must_be_immutable
class Confirm_Dialouge extends StatelessWidget {
  TextEditingController textEditingController;
  Confirm_Dialouge({this.textEditingController});
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
                'Do you want re-read all old candidates ?',
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
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
