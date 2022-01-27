import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/gmail.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/yahoo.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/step1.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class ConnectedToEmail extends StatefulWidget {
  @override
  State<ConnectedToEmail> createState() => _ConnectedToEmailState();
}

class _ConnectedToEmailState extends State<ConnectedToEmail> {
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
          child:
              // TextFormField(
              //   controller: emailController,
              //   autocorrect: true,

              //   decoration: const InputDecoration(

              //       hintText: 'Email',
              //       //labelText: 'Name *',
              //       ),
              //   validator: (String value) {
              //     return (value != null && value.contains('@'))
              //         ? 'Do not use the @ char.'
              //         : null;
              //   },
              // )

              TextInput(
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
            onTap: () {
              setState(() {});
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        emailController.text.contains('yahoo.com') ? ForYahoo() : Text(""),
        emailController.text.contains('gmail.com') ? ForEmail() : Text(""),
      ],
    );
  }
}
