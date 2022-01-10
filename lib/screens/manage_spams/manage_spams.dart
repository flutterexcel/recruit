import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/manage_spams/add_new_spam_contact.dart';
import 'package:flutter_product_recruit/screens/manage_spams/confirm_spam_dialouge.dart';
import 'package:flutter_product_recruit/screens/manage_spams/update_contact_dialouge.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Manage_Spams extends StatefulWidget {
  @override
  State<Manage_Spams> createState() => _Manage_SpamsState();
}

// ignore: camel_case_types
class _Manage_SpamsState extends State<Manage_Spams> {
  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Update_Contact());
        });
  }

  void _popupConfirmDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Confirm_Spam_Dialouge());
        });
  }

  void _popupAddNewSpamDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Add_New_Spam());
        });
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Users"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.white),
                      Text("Add Spam"),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _popupAddNewSpamDialog(context);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        // drawer: NavigationList(),s
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Contain(
                      outlinecolor: AppColors.grey,
                      borderrad: 8,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orange12,
                            ),
                            child: Text("S"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Textt(
                            text: "sbsachin699@zohomail.in",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                  scale: 0.6,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _popupDialog(context);
                                        });
                                      },
                                      child: Icon(Icons.edit))),
                              const SizedBox(
                                width: 20,
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _popupConfirmDialog(context);
                                      });
                                    },
                                    child: Icon(Icons.delete)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
