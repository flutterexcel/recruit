import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/step1.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class ForYahoo extends StatefulWidget {
  @override
  State<ForYahoo> createState() => _ForYahooState();
}

class _ForYahooState extends State<ForYahoo> {
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
                    "Yahoo Settings:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "**NOTE : IMAP settings are required to fetch email from your mailbox. You can get the correct settings here ",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "https://help.yahoo.com/kb/SLN4075.html?guccounter=1",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.blue),
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
            print(emailController.text.contains('yahoo.com'));
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => Step1()));
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
