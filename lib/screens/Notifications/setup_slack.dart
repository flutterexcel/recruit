import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/step1.dart';
import 'package:flutter_product_recruit/screens/Notifications/browser_notification.dart';
import 'package:flutter_product_recruit/screens/Notifications/daily_reports.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable, camel_case_types
class Notificationss extends StatefulWidget {
  @override
  State<Notificationss> createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  bool isSwitched = false;
  String _selectedChannel;
  String b =
      'You can also add a new slack channel and click on refresh If its a private channel, you need to invite our slack bot manually to the channel from slack ';

  String a =
      'If you have a slack account which your team user, you can setup that here and our platform will send notifications on slack and keep your team updated ';

  var items = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  outlinecolor: AppColors.grey,
                  borderrad: 3,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textt(
                            text: "Setup Slack",
                            size: 20,
                            fweight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Textt(
                            text: "configure your slack account",
                            size: 13,
                            tcolor: AppColors.grey,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Textt(
                            text: a,
                            size: 17,
                            tcolor: AppColors.grey,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.Black),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.grey,
                                  ),
                                  child: Text(
                                    "1",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Textt(
                                    text: "Add our app to your slack channel"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.grey),
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1)),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Expanded(
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: Image.asset(
                                            'assets/images/slack.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Expanded(
                                            child: Textt(
                                              text: "Add to Slack",
                                              //  size: 10,
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              width: 3,
                              height: 30,
                              color: AppColors.orange12,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.orange12),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.orange12,
                                  ),
                                  child: Text(
                                    "2",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Textt(
                                    text:
                                        "Select a slack channel for notification"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Contain(
                                height: 30,
                                width: 90,
                                //  width: MediaQuery.of(context).size.width,
                                outlinecolor: AppColors.grey,
                                borderrad: 3,
                                child: DropdownButton<String>(
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedChannel = value;
                                    });
                                  },
                                  value: _selectedChannel,

                                  // Hide the default underline
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  hint: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Channels',
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),

                                  // The list of options
                                  items: items
                                      .map((e) => DropdownMenuItem(
                                            child: Container(
                                              child: Text(
                                                e,
                                                style: TextStyle(fontSize: 13),
                                              ),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),

                                  // Customize the selected item
                                  selectedItemBuilder: (BuildContext context) =>
                                      items
                                          .map((e) => Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey),
                                                ),
                                              ))
                                          .toList(),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'refresh',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.grey),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Textt(
                            text: b,
                            tcolor: AppColors.grey,
                            size: 14,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Buttonn(
                                text: "Send a Text Message",
                                bgcolor: AppColors.orange12,
                                borderRadius: 2,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Step1()));
                                },
                              ),
                              Buttonn(
                                text: "Save",
                                bgcolor: AppColors.blue,
                                borderRadius: 2,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Step1()));
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Browser_Notificationss(),
              const SizedBox(
                height: 5,
              ),
              Daily_Reports(),
            ],
          ),
        ));
  }
}
