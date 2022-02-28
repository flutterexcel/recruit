// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';

// ignore: camel_case_types, must_be_immutable
class ChangePass extends StatelessWidget {
  // TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 220,
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
                'Change Password',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontFamily: 'RobotRegular',
                    fontWeight: FontWeight.bold),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'New Password',
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
                borderRadius: 1,
                autocorrect: true,
                hintText: "Enter New Password",
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
                  'Change',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () {}),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
