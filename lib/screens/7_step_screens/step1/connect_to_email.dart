import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/step1.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class ConnectedToEmail extends StatelessWidget {
  TextEditingController imapController =
      new TextEditingController(text: "imap.mail.yahoo.com");

  TextEditingController emailController = new TextEditingController();

  TextEditingController serverController =
      new TextEditingController(text: "SSL");

  TextEditingController portController = new TextEditingController(text: "993");
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
            img: emailController.text.contains('yahoo.com')
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
                : Container(
                    child: Transform.scale(
                      scale: 0.6,
                      child: Image.asset(
                        'assets/images/gmaill.png',
                        height: 5,
                        width: 5,
                      ),
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
            hintText: "Password",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
                      Text(
                        "2FA",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.blue),
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
                      Text(
                        "enable app",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.blue),
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
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextInput(
            controller: serverController,
            borderRadius: 1,
            autocorrect: true,
            hintText: "SSL",
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
        Buttonn(
          text: "Add",
          bgcolor: AppColors.blue,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Step1()));
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
