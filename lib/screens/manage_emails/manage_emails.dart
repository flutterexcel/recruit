import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/step3.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class ManageEmail extends StatefulWidget {
  @override
  State<ManageEmail> createState() => _ManageEmailState();
}

class _ManageEmailState extends State<ManageEmail> {
  String dropdownvalue;
  String c =
      '#date:  #time:  #round_name:  #job_profile:  #joining_date:  #company:  #venue:  #hr_signature:  #name:  #logo:  #interview_date:  #interview_time:  #test_link:  #interview_link:  ';
  String b =
      'There are some variables which you can use in your email template for dynamic content like candidate name, phone no, etc. Here is a list of variables you can use! ';
  String a =
      'This will automatically send remainder of this email to the candidate for 3 days on different times of the day. If a candidate replies to this email then a remainder will not be sent anymore.';
  String selectedJob;
  bool _isChecked = false;
  bool _isBoldClicked = false;
  bool _isItalicClicked = false;
  bool _isUnderlinedClicked = false;
  bool _isChecked2 = false;
  bool _newMessage = true;

  List<String> items = [
    'ReactJs Developer',
    'Angular Developer',
    'JavaScript Frontend Developer',
    'NodeJS Developer',
    'UX/UI Graphic Designer',
    'PHP Developer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.Black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Manage Emails",
            style: TextStyle(color: AppColors.Black, fontSize: 23),
            textAlign: TextAlign.left,
          ),
        ),
        drawer: NavigationList(),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Textt(
                                    text: "Manage your email messages",
                                    fweight: FontWeight.bold,
                                    size: 16,
                                  ),
                                  Textt(
                                    text:
                                        "Add/edit your messages which you can reuse later on.",
                                    size: 10,
                                  ),
                                ],
                              ),
                            ),
                            Buttonn(
                              text:
                                  _newMessage ? "New Message" : "All Templates",
                              bgcolor: AppColors.orange12,
                              onTap: () {
                                setState(() {
                                  _newMessage = !_newMessage;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // DropdownButton<String>(
                        //   onChanged: (value) {
                        //     setState(() {
                        //       dropdownvalue = value;
                        //     });
                        //   },
                        //   value: dropdownvalue,

                        //   // Hide the default underline
                        //   //    underline: SizedBox(),
                        //   hint: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       'Filter via job',
                        //       style:
                        //           TextStyle(fontSize: 13, color: Colors.grey),
                        //     ),
                        //   ),

                        //   isExpanded: true,

                        //   // The list of options
                        //   items: items
                        //       .map((e) => DropdownMenuItem(
                        //             child: Container(
                        //               child: Text(
                        //                 e,
                        //                 style: TextStyle(fontSize: 13),
                        //               ),
                        //             ),
                        //             value: e,
                        //           ))
                        //       .toList(),

                        //   // Customize the selected item
                        //   selectedItemBuilder: (BuildContext context) => items
                        //       .map((e) => Align(
                        //             alignment: Alignment.centerLeft,
                        //             child: Text(
                        //               e,
                        //               style: TextStyle(
                        //                   fontSize: 13, color: Colors.grey),
                        //             ),
                        //           ))
                        //       .toList(),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(
                              text: "Template Name",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextInput(
                          borderRadius: 1,
                          autocorrect: true,
                          hintText: "This is a short label that you will see",
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Textt(
                              text: "Subject",
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextInput(
                          borderRadius: 1,
                          autocorrect: true,
                          hintText: "This is the subject of the email message",
                        ),
                        const SizedBox(height: 15),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 12.0),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Textt(
                        //       text: "Job Profile",
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 5),
                        // DropdownButton<String>(
                        //   onChanged: (value) {
                        //     setState(() {
                        //       selectedJob = value;
                        //     });
                        //   },
                        //   value: selectedJob,

                        //   // Hide the default underline
                        //   //    underline: SizedBox(),
                        //   hint: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       'Select job profile',
                        //       style:
                        //           TextStyle(fontSize: 13, color: Colors.grey),
                        //     ),
                        //   ),

                        //   isExpanded: true,

                        //   // The list of options
                        //   items: items
                        //       .map((e) => DropdownMenuItem(
                        //             child: Container(
                        //               child: Text(
                        //                 e,
                        //                 style: TextStyle(fontSize: 13),
                        //               ),
                        //             ),
                        //             value: e,
                        //           ))
                        //       .toList(),

                        //   // Customize the selected item
                        //   selectedItemBuilder: (BuildContext context) => items
                        //       .map((e) => Align(
                        //             alignment: Alignment.centerLeft,
                        //             child: Text(
                        //               e,
                        //               style: TextStyle(
                        //                   fontSize: 13, color: Colors.grey),
                        //             ),
                        //           ))
                        //       .toList(),
                        // ),

                        TextFormField(
                          style: TextStyle(
                              fontWeight: _isBoldClicked
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontStyle: _isItalicClicked
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              decoration: _isUnderlinedClicked
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: "This is the content of the email",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(
                            top: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Contain(
                                borderrad: 5,
                                outlinecolor: AppColors.grey,
                                backcolor: AppColors.white,
                                height: 35,
                                width: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      print(" bold clicked");
                                      setState(() {
                                        _isBoldClicked = !_isBoldClicked;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: _isBoldClicked
                                          ? Color(0XFFfff5b9)
                                          : Colors.white12,
                                      primary: Colors.black,
                                    ),
                                    child: Text('B',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Contain(
                                borderrad: 5,
                                outlinecolor: AppColors.grey,
                                backcolor: AppColors.white,
                                height: 35,
                                width: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      print(" Italic clicked");
                                      setState(() {
                                        _isItalicClicked = !_isItalicClicked;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: _isItalicClicked
                                          ? Color(0XFFfff5b9)
                                          : Colors.white12,
                                      primary: Colors.black,
                                    ),
                                    child: Text('I',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Contain(
                                borderrad: 5,
                                outlinecolor: AppColors.grey,
                                backcolor: AppColors.white,
                                height: 35,
                                width: 30,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      print(" Italic clicked");
                                      setState(() {
                                        _isUnderlinedClicked =
                                            !_isUnderlinedClicked;
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: _isUnderlinedClicked
                                          ? Color(0XFFfff5b9)
                                          : Colors.white12,
                                      primary: Colors.black,
                                    ),
                                    child: Text('U',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "SMS",
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextInput(
                              borderRadius: 1,
                              hintText: "Add a small message for sms",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text('Send reminder automatically'),
                            activeColor: const Color(0xFF00E5FF),
                            checkColor: Colors.white,
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value;
                              });
                            }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              title: const Text('set as Default'),
                              activeColor: const Color(0xFF00E5FF),
                              checkColor: Colors.white,
                              value: _isChecked2,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked2 = value;
                                });
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Textt(
                          text: a,
                          size: 14,
                          tcolor: AppColors.grey,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Textt(
                          text: 'Email Variables',
                          // size: 14,
                          // tcolor: AppColors.grey,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Textt(
                          text: b,
                          //   size: 14,
                          //  tcolor: AppColors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Textt(
                          text: c,
                          //   size: 14,
                          //  tcolor: AppColors.grey,
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Buttonn(
                            text: "Save",
                            bgcolor: AppColors.blue,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Step3()));
                            },
                          ),
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
