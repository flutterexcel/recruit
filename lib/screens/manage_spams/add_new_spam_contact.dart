import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/screens/manage_spams/manage_spams.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/snackbar.dart';

// ignore: camel_case_types
class Add_New_Spam extends StatelessWidget {
  var state;
  Add_New_Spam({this.state});
  final TextEditingController textEditingController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("new state");
    print(state);
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 250,
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
                    fontSize: 13,
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
                  // ignore: missing_return
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
                  'Add Contact',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () async {
                  //print(textEditingController.text);
                  if (_formKey.currentState.validate()) {
                    // BlocProvider.of<ManageSpamBloc>(context)
                    //     .add(AddEmailEvent(textEditingController.text));

                    // context
                    //     .bloc<ManageSpamBloc>()
                    //     .add(AddEmailEvent(textEditingController.text));
                    // var res = await ManageSpamService.addManageSpamEmail(
                    //     textEditingController.text);
                    // print(res.message);
                    // if (res.message == 'Contact is Already Added') {
                    //   Utils.showSnackBar(
                    //       context, "Contact is Already Added", AppColors.pink);
                    // } else {
                    //   Utils.showSnackBar(
                    //       context, "Email Added Succesfully", AppColors.pink);
                    // }
                    Navigator.pop(context, textEditingController.text);
                    //   Manage_Spams();
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
