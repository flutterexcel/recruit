// ignore_for_file: must_be_immutable, deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';

import 'package:flutter_product_recruit/widgets/TextInput.dart';

// ignore: camel_case_types

class EmailDialouge extends StatefulWidget {
  var state;

  EmailDialouge({this.state});

  @override
  State<EmailDialouge> createState() => _EmailDialougeState();
}

class _EmailDialougeState extends State<EmailDialouge> {
  final TextEditingController textEditingController =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isCcPressed = false;
  bool isBccPressed = false;
  // QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    print("new state--${widget.state}");
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      //height: 250,
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
                  'Send mail to candidate',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 17,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'To',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(
                  height: 6,
                ),
                Stack(children: [
                  TextInput(
                    controller: textEditingController,
                    borderRadius: 1,
                    autocorrect: true,
                    validateText: (value) {
                      if (value.isEmpty) {
                        return "Email is required";
                      } else if (!regExp.hasMatch(value)) {
                        return "Email is not valid";
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            "Cc",
                            style: TextStyle(
                              fontSize: 19,
                              color: AppColors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isCcPressed = !isCcPressed;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          child: Text(
                            "Bcc",
                            style: TextStyle(
                              fontSize: 19,
                              color: AppColors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              isBccPressed = !isBccPressed;
                            });
                          },
                        )
                      ],
                    ),
                  )
                ]),
                SizedBox(
                  height: 15,
                ),
                isCcPressed
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CC',
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
                          ),
                        ],
                      )
                    : SizedBox(
                        width: 0,
                      ),
                isBccPressed
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Bcc',
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
                          ),
                        ],
                      )
                    : SizedBox(
                        width: 0,
                      ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Template',
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
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Subject',
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
                ),
                SizedBox(
                  height: 15,
                ),

                // Expanded(
                //     child: Container(
                //   decoration: BoxDecoration(boxShadow: [
                //     BoxShadow(
                //       color: Colors.lightBlueAccent,
                //       offset: const Offset(5.0, 5.0),
                //       blurRadius: 10.0,
                //       spreadRadius: 2.0,
                //     ),
                //     BoxShadow(
                //         color: Colors.white,
                //         offset: const Offset(0.0, 0.0),
                //         blurRadius: 0.0,
                //         spreadRadius: 0.0)
                //   ]),
                //   child: QuillEditor.basic(
                //     controller: _controller,
                //     readOnly: true,
                //   ),
                // )),
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
                  'Send',
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
