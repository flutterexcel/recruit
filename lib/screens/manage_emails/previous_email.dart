// ignore_for_file: must_be_immutable, deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/manage_spam/manage_spam_service.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/snackbar.dart';

// ignore: camel_case_types

class PreviousEmail extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var state;

  PreviousEmail({this.state});

  @override
  Widget build(BuildContext context) {
    print("new state--$state");
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
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
                  'Previous Email',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'Message will be send to the below address.We will pick a job profile and candidate on random for preview of email.',
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
                Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 6,
                ),
                TextInput(
                  controller: textEditingController,
                  borderRadius: 1,
                  autocorrect: true,
                  hintText: "E-mail",
                  validateText: (value) {
                    if (value.isEmpty) {
                      return "Email is required";
                    } else if (!regExp.hasMatch(value)) {
                      return "Email is not valid";
                    }
                  },
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
                  'Submit',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () async {
                  //print(textEditingController.text);

                  if (_formKey.currentState.validate()) {
                    AddSpamModel res =
                        await ManageSpamService.addManageSpamEmail(
                            textEditingController.text);

                    if (res.message == 'Contact is Already Added') {
                      Utils.showSnackBar(
                          context, "Contact is Already Added", AppColors.pink);
                    } else {
                      Utils.showSnackBar(
                          context, "Email Added Succesfully", AppColors.pink);
                    }
                    context
                        .bloc<ManageSpamBloc>()
                        .add(ManageSpamInitialEvent());
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => ManageSpam()));

                    Navigator.pop(context);
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
