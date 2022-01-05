import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Account"),
        ),
        // drawer: NavigationList(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Transform.scale(
                    scale: 1.0,
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      },
                      activeTrackColor: const Color(0xFF00E5FF),
                      activeColor: const Color(0xFF00E5FF),
                    ),
                  ),
                  Textt(
                    text: "Don't show quick message during shortlist",
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Textt(
                      text: "PERSONAL ",
                      size: 15,
                    ),
                    Textt(
                      text: "PROFILE ",
                      size: 15,
                      fweight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/def.png'),
                  radius: 38,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextInput(
                      autocorrect: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextInput(
                      hintText: "phone number",
                      autocorrect: true,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      //   controller: userNameController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fillColor: AppColors.veryLightGrey,
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Template Signature",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextInput(
                      hintText: "Write your signature here...",
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              Buttonn(
                text: "Save",
                bgcolor: AppColors.Blue,
                leftPadding: 15.0,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Step5()));
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Textt(
                      text: "CHANGE ",
                      size: 15,
                    ),
                    Textt(
                      text: "PASSWORD",
                      size: 15,
                      fweight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Old Password",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextInput(
                      hintText: "Old Password",
                      autocorrect: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 9),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "New Password",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextInput(
                      hintText: "New Password",
                      autocorrect: true,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextInput(
                      hintText: "Confirm Password",
                      autocorrect: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Buttonn(
                text: "Save",
                bgcolor: AppColors.Blue,
                leftPadding: 15.0,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Step1()));
                },
              ),
              const SizedBox(height: 15),
            ],
          ),
        ));
  }
}
