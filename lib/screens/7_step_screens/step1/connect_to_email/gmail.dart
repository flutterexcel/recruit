// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ForEmail extends StatefulWidget {
  @override
  State<ForEmail> createState() => _ForEmailState();
  String password;
  ForEmail(this.password);
}

class _ForEmailState extends State<ForEmail> {
  TextEditingController imapController =
      new TextEditingController(text: "imap.gmail.com");

  TextEditingController emailController = new TextEditingController();

  TextEditingController portController = new TextEditingController(text: "993");
  String _value = "TLS";

  String emailUrl =
      "https://support.google.com/accounts/answer/185839?co=GENIE.Platform%3DDesktop&hl=en";
  String enableAppUrl =
      'https://support.google.com/accounts/answer/185833?hl=en';
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    print(widget.password);
    return Column(
      children: [
        isPressed
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Contain(
                      width: MediaQuery.of(context).size.width,
                      backcolor: AppColors.Red,
                      outlinecolor: AppColors.grey,
                      borderrad: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Invalid Credentials(Failure)",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )
            : Text(""),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Contain(
            //   height: 180,
            width: MediaQuery.of(context).size.width,
            backcolor: AppColors.orange12,
            outlinecolor: AppColors.grey,
            borderrad: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gmail Settings:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "**NOTE : The recommended way is for your to",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text("setup "),
                      InkWell(
                        child: Text(
                          "2FA",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.blue),
                        ),
                        onTap: () async {
                          if (!await canLaunch(emailUrl)) {
                            await launch(
                              emailUrl,
                              forceSafariVC: true,
                              forceWebView: true,
                            );
                          } else {
                            throw 'Could not launch $emailUrl';
                          }
                        },
                      ),
                      Text(" authentication on your gmail account and"),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text("and "),
                      InkWell(
                        child: Text(
                          "enable app",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.blue),
                        ),
                        onTap: () async {
                          if (!await canLaunch(enableAppUrl)) {
                            await launch(
                              enableAppUrl,
                              forceSafariVC: true,
                              forceWebView: true,
                            );
                          } else {
                            throw 'Could not launch $enableAppUrl';
                          }
                        },
                      ),
                      Text(" specific passwords.This way you"),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "don't have to share with us your actual gmail password and your account is fully secure!",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Textt(
              text: "Incoming Server Mail (IMAP)",
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextInput(
            controller: imapController,
            borderRadius: 1,
            autocorrect: true,
            hintText: "IMAP",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Textt(
              text: "Require Server",
            ),
          ),
        ),
        const SizedBox(height: 5),
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
                  _value = "TLS";
                });
              },
              child: InkWell(child: Text('TLS')),
            ),
            PopupMenuItem<String>(
              onTap: () {
                setState(() {
                  _value = "SSL";
                  print(_value);
                });
              },
              child: InkWell(child: Text('SSL')),
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Textt(
              text: "Port",
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextInput(
            controller: portController,
            borderRadius: 1,
            autocorrect: true,
            hintText: "993",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        widget.password.length > 0
            ? Buttonn(
                text: "Add",
                bgcolor: AppColors.blue,
                onTap: () {
                  print(emailController.text.contains('yahoo.com'));
                  setState(() {
                    isPressed = true;
                  });
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => Step1()));
                },
              )
            : Opacity(
                opacity: 0.6,
                child: Buttonn(
                  text: "Add",
                  bgcolor: AppColors.blue,
                  onTap: null,
                ),
              ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
