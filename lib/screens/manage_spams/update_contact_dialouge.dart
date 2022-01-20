// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';

// ignore: camel_case_types
class Update_Contact extends StatefulWidget {
  ManageSpamList update;
  Update_Contact({this.update});

  @override
  State<Update_Contact> createState() => _Update_ContactState();
}

class _Update_ContactState extends State<Update_Contact> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.update.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("update id --${widget.update}");
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
              Center(
                child: Text(
                  'Edit Spam Contact',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
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
                controller: emailController,
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
                height: 40,
                minWidth: 6,
                color: AppColors.Orange,
                child: Text(
                  'Update Contact',
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
