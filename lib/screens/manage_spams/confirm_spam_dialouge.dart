import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';

class Confirm_Spam_Dialouge extends StatelessWidget {
  TextEditingController textEditingController;
  Confirm_Spam_Dialouge({this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      width: MediaQuery.of(context).size.width - 150,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Are You Sure?',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontFamily: 'RobotRegular',
              ),
              //  textDirection: TextDirection.ltr,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No',
                style: TextStyle(fontSize: 13),
              ),
              FlatButton(
                  height: 30,
                  minWidth: 4,
                  color: AppColors.Orange,
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 13),
                  ),
                  textColor: Colors.white,
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
