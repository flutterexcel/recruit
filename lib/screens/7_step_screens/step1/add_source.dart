import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/connect_to_email/connect_to_email.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class AddSource extends StatefulWidget {
  @override
  State<AddSource> createState() => _AddSourceState();
}

class _AddSourceState extends State<AddSource> {
  bool emailPressed = false;

  String a =
      'Recruit will automatically fetch candidate from your any email inbox which you setup here. You  can do a job posting on Naukri, Monster or any other job portal and get all your candidates in your inbox. Recruit will automatically go through the email and fetch all relevant candidate information for you.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.Black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Add Source",
            style: TextStyle(color: AppColors.Black, fontSize: 23),
            textAlign: TextAlign.left,
          ),
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
                  //  height: 50,
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
                                        child: Textt(
                                          text: "Connect Your Gmail",
                                          size: 13,
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
                                ? ConnectedToEmail()
                                : const SizedBox(
                                    height: 5,
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
