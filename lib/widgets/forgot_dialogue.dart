import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';

class ForgotDialogue extends StatelessWidget {
  TextEditingController textEditingController;
  ForgotDialogue({this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Reset your Password',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Please Enter Your Email',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              TextFormField(
                controller: textEditingController,
                style: TextStyle(fontFamily: 'RobotRegular'),
                cursorColor: Colors.black,
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              height: 24,
              minWidth: 6,
                    color: AppColors.Orange,
                    child: Text(
                      'Submit',
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
