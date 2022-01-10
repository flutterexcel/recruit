import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable, camel_case_types
class Browser_Notificationss extends StatefulWidget {
  @override
  State<Browser_Notificationss> createState() => _Browser_NotificationssState();
}

// ignore: camel_case_types
class _Browser_NotificationssState extends State<Browser_Notificationss> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Contain(
        outlinecolor: AppColors.grey,
        borderrad: 10,
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textt(
                  text: "Browser Notifications",
                  size: 20,
                  fweight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 1,
                ),
                Textt(
                  text: "turn on browser notifications",
                  size: 13,
                  tcolor: AppColors.grey,
                ),
                const SizedBox(
                  height: 25,
                ),
                Textt(
                  text: "Enable desktop notifications for your team.",
                  size: 20,
                  tcolor: AppColors.grey,
                  fweight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 25,
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = !isSwitched;
                    });
                  },
                  activeTrackColor: const Color(0xFF00E5FF),
                  activeColor: const Color(0xFF00E5FF),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Buttonn(
                      text: "Send a Text Message",
                      bgcolor: AppColors.orange12,
                      borderRadius: 2,
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Step1()));
                      },
                    ),
                    Buttonn(
                      text: "Save",
                      bgcolor: AppColors.blue,
                      borderRadius: 2,
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Step2()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Step2() {}
