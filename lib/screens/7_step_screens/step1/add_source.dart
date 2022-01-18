import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/step1.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: camel_case_types
class AddSource extends StatefulWidget {
  @override
  State<AddSource> createState() => _AddSourceState();
}

class _AddSourceState extends State<AddSource> {
  bool emailPressed = false;

  TextEditingController imapController =
      new TextEditingController(text: "imap.mail.yahoo.com");

  TextEditingController emailController =
      new TextEditingController(text: "com");

  TextEditingController serverController =
      new TextEditingController(text: "SSL");

  TextEditingController portController = new TextEditingController(text: "993");

  String a =
      'Recruit will automatically fetch candidate from your any email inbox which you setup here. You  can do a job posting on Naukri, Monster or any other job portal and get all your candidates in your inbox. Recruit will automatically go through the email and fetch all relevant candidate information for you.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Job"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  //  width: MediaQuery.of(context).size.width,
                  height: 50,
                  borderrad: 2,
                  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Textt(
                            text:
                                "Connect your inbox so that we can access all your candidate and generate your candidate database",
                            size: 15,
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  outlinecolor: Colors.black,
                  borderrad: 10,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textt(
                              text: "Import Resume From Your Inbox",
                              size: 17,
                              fweight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Textt(
                              text: a,
                              size: 16,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Contain(
                              width: 200,
                              height: 50,
                              borderrad: 2,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.0),
                                    child: Transform.scale(
                                      scale: 0.6,
                                      child: Image.asset(
                                        'assets/images/gmaill.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        child: Expanded(
                                          child: Textt(
                                            text: "Connect Your Gmail",
                                            size: 13,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Contain(
                              width: 200,
                              height: 50,
                              borderrad: 2,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/images/email.jpg'),
                                      radius: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Textt(
                                            text: "Connect Any Email",
                                            size: 13,
                                          ),
                                        )),
                                    onTap: () {
                                      setState(() {
                                        emailPressed = !emailPressed;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Contain(
                              width: 200,
                              height: 50,
                              borderrad: 2,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/naukri.png'),
                                      radius: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        child: Textt(
                                          text: "Connected to naukri.",
                                          size: 13,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            emailPressed
                                ? Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Textt(
                                            text: "Email",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: TextInput(
                                          controller: emailController,
                                          borderRadius: 1,
                                          autocorrect: true,
                                          hintText: "Email",
                                          img: emailController.text
                                                  .contains('yahoo.com')
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
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Textt(
                                            text: "Password",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
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
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Contain(
                                          //   height: 180,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          backcolor: AppColors.orange12,
                                          outlinecolor: AppColors.grey,
                                          borderrad: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Gmail Settings:",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  "**NOTE : The recommended way is for your to",
                                                  style:
                                                      TextStyle(fontSize: 15),
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
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color:
                                                              AppColors.blue),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          " authentication on your gmail account and"),
                                                    ),
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
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          color:
                                                              AppColors.blue),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          " specific passwords.This way you"),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  "don't have to share with us your actual gmail password and your account is fully secure!",
                                                  style:
                                                      TextStyle(fontSize: 15),
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
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Textt(
                                            text: "Incoming Server Mail (IMAP)",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
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
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Textt(
                                            text: "Require Server",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
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
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Textt(
                                            text: "Port",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
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
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Step1()));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 20,
                                  ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
