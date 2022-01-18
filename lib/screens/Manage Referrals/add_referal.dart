// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/show_referral.dart';
import 'package:flutter_product_recruit/services/manage_referral/add_referral_services.dart';
import 'package:flutter_product_recruit/services/manage_referral/get_referal_services.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class Add_Referal extends StatefulWidget {
  @override
  State<Add_Referal> createState() => _Add_ReferalState();
}

class _Add_ReferalState extends State<Add_Referal> {
  bool isSwitched = false;

  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Referral"),
        ),
        // drawer: NavigationList(),s
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  borderrad: 5,
                  backcolor: AppColors.purple,
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          child: Row(
                        children: [
                          Textt(
                            text: "Info!",
                            size: 15,
                            fweight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Textt(
                              text:
                                  "By adding referrals,we allow all forwarded emailswith this referrals ",
                              size: 15,
                            ),
                          )
                        ],
                      ))),
                ),
              ),
              Padding(
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
                            text: "Add Referral Domain",
                            size: 18,
                            fweight: FontWeight.bold,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Textt(
                            text:
                                "Excellence RMS automatically takes all emails details from your Referral domain.",
                            size: 15,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Textt(
                                text: "*Domain",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            child: TextInput(
                              controller: textEditingController,
                              hintText: "Enter Referral Domain",
                              autocorrect: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Textt(
                            text: "*e.g -yourcompany.com",
                            tcolor: AppColors.grey,
                            size: 15,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 75,
                            child: Buttonn(
                              text: "Add",
                              bgcolor: AppColors.blue,
                              onTap: () async {
                                var res = await Provider.of<AddReferralService>(
                                        context,
                                        listen: false)
                                    .addReferralEmail(
                                        textEditingController.text);
                                print("----$res");

                                // ignore: deprecated_member_use
                                // context.bloc<ManageReferralBloc>().add(
                                //     AddReferralEvent(
                                //         textEditingController.text));

                                // var res =
                                //     await AddReferralService.addReferralEmail(
                                //         textEditingController.text);

                                // print(res.message);
                                if (res != null) {
                                  Utils.showSnackBar(context,
                                      "Added Successfully", AppColors.Orange);
                                  //  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => GetReferrals()));

                                  // GetReferrals();
                                }
                              },
                            ),
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
            ],
          ),
        ));
  }
}
