// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/services/manage_spam/add_spam_email_service.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/snackbar.dart';

// ignore: camel_case_types
class Add_New_Spam extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();
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
                'Add New Spam Contact',
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
                'E-mail',
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
                controller: textEditingController,
                borderRadius: 1,
                autocorrect: true,
                hintText: "E-mail",
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                height: 35,
                // minWidth: 2,
                color: AppColors.Orange,
                child: Text(
                  'Add Contact',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () async {
                  //print(textEditingController.text);
                  var res = await Add_Spam_Email_Service.addManageSpamEmail(
                      textEditingController.text);

                  print(res.message);
                  if (res.message == null) {
                    Utils.showSnackBar(
                        context, "Added Successfully", AppColors.Orange);
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