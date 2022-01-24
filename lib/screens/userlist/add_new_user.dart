// ignore_for_file: deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_bloc.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_event.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/userlist_services/add_new_user.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable, camel_case_types
class AddNewUser extends StatefulWidget {
  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _value = "";
  @override
  Widget build(BuildContext context) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.Black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Add New User",
            style: TextStyle(color: AppColors.Black, fontSize: 23),
            textAlign: TextAlign.left,
          ),
        ),
        // drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Contain(
                    outlinecolor: AppColors.grey,
                    borderrad: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, top: 12.0, right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(text: "Name"),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Contain(
                            width: MediaQuery.of(context).size.width,
                            outlinecolor: AppColors.grey,
                            borderrad: 10,
                            child: TextInput(
                              autocorrect: true,
                              hintText: "Name",
                              controller: name,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "Email",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextInput(
                              autocorrect: true,
                              hintText: "Email",
                              controller: email,
                              validateText: (value) {
                                if (value.isEmpty) {
                                  return "Email is required";
                                } else if (!regExp.hasMatch(value)) {
                                  return "Email is not valid";
                                }
                                // else if (value.contains('@gmail.com')) {
                                //   return "Email is not valid";
                                // }
                              }),
                          const SizedBox(height: 15),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Textt(
                                  text: "Password",
                                ),
                              ),
                              const SizedBox(height: 5),
                              TextInput(
                                  hintText: "Password",
                                  obscureText: true,
                                  controller: password,
                                  validateText: (value) {
                                    if (value.isEmpty) {
                                      return "Password is required";
                                    }
                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "Confirm Password",
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextInput(
                              hintText: "Confirm Password",
                              obscureText: true,
                              controller: cpassword,
                              validateText: (value) {
                                if (value.isEmpty) {
                                  return "Confirm password is required";
                                } else if (value != password.text) {
                                  return 'password not matched';
                                }
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "Phone Number",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextInput(
                              hintText: "Phone Number",
                              autocorrect: true,
                              controller: phone,
                              keyboardtype: TextInputType.phone,
                              maxLength: 10,
                              validateText: (value) {
                                if (value.isEmpty) {
                                  return "Phone is required";
                                }
                              }),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "Select Role",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // TextField_Int(
                          //   autocorrect: true,
                          // ),
                          PopupMenuButton(
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  // color: Colors.yellow,
                                  // Red border with the width is equal to 5
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  _value,
                                ),
                              ),
                            ),

                            // key: _menuKey,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                onTap: () {
                                  setState(() {
                                    _value = "Admin";
                                  });
                                },
                                child: InkWell(child: Text('Admin')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  setState(() {
                                    _value = "HR";
                                    print(_value);
                                  });
                                },
                                child: InkWell(child: Text('HR')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () {
                                  setState(() {
                                    _value = "Interviewee";
                                    print(_value);
                                  });
                                },
                                child: InkWell(child: Text('Interviewee')),
                              ),
                            ],
                            onSelected: (value) {
                              print("-------------$value");
                              setState(() {
                                _value = value;
                                print(_value);
                              });
                            },
                            elevation: 8,
                          ),
                          const SizedBox(height: 15),
                          Buttonn(
                            text: "Add User",
                            bgcolor: AppColors.blue,
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                AddSpamModel res =
                                    await AddUserListService.addUserList(
                                        name.text,
                                        email.text,
                                        password.text,
                                        cpassword.text,
                                        phone.text,
                                        _value);

                                Utils.showSnackBar(
                                    context, res.message, AppColors.Green);

                                context
                                    .bloc<UserListBloc>()
                                    .add(UserListInitialEvent());
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context) => ManageSpam()));

                                Navigator.pop(context);
                              }
                              // Navigator.pop(context);
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
