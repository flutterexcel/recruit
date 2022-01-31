import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/gmail.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/hotmail.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/unknown_provider.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/yahoo.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class ConnectedToEmail extends StatefulWidget {
  @override
  State<ConnectedToEmail> createState() => _ConnectedToEmailState();
}

class _ConnectedToEmailState extends State<ConnectedToEmail> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextInput(
              controller: emailController,
              borderRadius: 1,
              autocorrect: true,
              hintText: "Email",
              keyboardtype: TextInputType.emailAddress,
              validateText: (value) {
                if (value.isEmpty) {
                  return "*Email is required";
                }
              },
              img: emailController.text.contains('@yahoo.com')
                  ? Container(
                      child: Transform.scale(
                        scale: 0.6,
                        child: Image.asset(
                          'assets/images/yahoo.png',
                          height: 5,
                          width: 5,
                        ),
                      ),
                    )
                  : emailController.text.contains('@gmail.com')
                      ? Container(
                          child: Transform.scale(
                            scale: 0.6,
                            child: Image.asset(
                              'assets/images/gmaill.png',
                              height: 5,
                              width: 5,
                            ),
                          ),
                        )
                      : emailController.text.contains('@hotmail.com')
                          ? Container(
                              child: Transform.scale(
                                scale: 0.6,
                                child: Image.asset(
                                  'assets/images/outlook.png',
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                            )
                          : Container(
                              child: Transform.scale(
                                scale: 0.6,
                                child: Image.asset(
                                  'assets/images/email.jpg',
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                            )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Textt(
              text: "Password",
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextInput(
            borderRadius: 1,
            obscureText: true,
            autocorrect: true,
            controller: passwordController,
            hintText: "Password",
            onChanged: (text) {
              setState(() {});
            },
            validateText: (value) {
              if (value.isEmpty) {
                return "*Password is required";
              }
            },
            onTap: () {
              setState(() {});
            },
          ),
        ),
        emailController.text.contains('@yahoo.com')
            ? ForYahoo(passwordController.text)
            : Text(""),
        emailController.text.contains('@gmail.com')
            ? ForEmail(passwordController.text)
            : Text(""),
        emailController.text.contains('@hotmail.com')
            ? ForHotmail(passwordController.text)
            : Text(""),
        (emailController.text.length != 0 &&
                (!emailController.text.contains('@yahoo.com') &&
                    !emailController.text.contains('@gmail.com') &&
                    !emailController.text.contains('@hotmail.com')))
            ? UnkwonProvider()
            : Text(""),
      ],
    );
  }
}
