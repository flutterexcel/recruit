import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/step3.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';

// ignore: must_be_immutable, camel_case_types
class AddNewUser extends StatefulWidget {
  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  String _value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        // drawer: NavigationList(),
        body: SingleChildScrollView(
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
                        ),
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
                            ),
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
                        ),
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
                        ),
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
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                // color: Colors.yellow,
                                // Red border with the width is equal to 5
                                border: Border.all(color: Colors.grey)),
                            child: Text(_value.toString()),
                          ),

                          // key: _menuKey,
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            PopupMenuItem<String>(
                              child: InkWell(
                                onTap: () {
                                  print('Admin');
                                },
                                child: Text('Admin'),
                              ),
                            ),
                            PopupMenuItem<String>(
                              child: InkWell(
                                onTap: () {
                                  print('HR');
                                },
                                child: Text('HR'),
                              ),
                            ),
                            PopupMenuItem<String>(
                              child: InkWell(
                                onTap: () {
                                  print('Interviewee');
                                },
                                child: Text('Interviewee'),
                              ),
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
                            //         AddSpamModel res =
                            //     await ManageSpamService.addManageSpamEmail(
                            //         textEditingController.text);

                            // if (res.message == 'Contact is Already Added') {
                            //   Utils.showSnackBar(
                            //       context, "Contact is Already Added", AppColors.pink);
                            // } else {
                            //   Utils.showSnackBar(
                            //       context, "Email Added Succesfully", AppColors.pink);
                            // }
                            // context
                            //     .bloc<ManageSpamBloc>()
                            //     .add(ManageSpamInitialEvent());
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => ManageSpam()));

                            Navigator.pop(context);
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
        ));
  }
}
