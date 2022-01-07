import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/step3.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_product_recruit/widgets/tf_int.dart';

// ignore: must_be_immutable, camel_case_types
class Add_New_User extends StatefulWidget {
  @override
  State<Add_New_User> createState() => _Add_New_UserState();
}

class _Add_New_UserState extends State<Add_New_User> {
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
                        TextField_Int(
                          autocorrect: true,
                        ),
                        const SizedBox(height: 15),
                        Buttonn(
                          text: "Add User",
                          bgcolor: AppColors.blue,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Step3()));
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
