import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ForYahoo extends StatefulWidget {
  @override
  State<ForYahoo> createState() => _ForYahooState();
  String password;
  ForYahoo(this.password);
}

class _ForYahooState extends State<ForYahoo> {
  TextEditingController imapController =
      new TextEditingController(text: "imap.mail.yahoo.com");

  TextEditingController emailController = new TextEditingController();
  String _value = "SSL";

  TextEditingController portController = new TextEditingController(text: "993");
  String yahooUrl = 'https://help.yahoo.com/kb/SLN4075.html?guccounter=1';
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
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
                  InkWell(
                    child: Text(
                      yahooUrl,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.blue),
                    ),
                    onTap: () async {
                      if (!await canLaunch(yahooUrl)) {
                        await launch(
                          yahooUrl,
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                        );
                      } else {
                        throw 'Could not launch $yahooUrl';
                      }
                    },
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
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _value,
              ),
            ),
          ),
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
