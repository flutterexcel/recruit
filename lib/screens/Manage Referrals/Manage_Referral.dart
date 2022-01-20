import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/add_referal.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable, camel_case_types
class ManageReferral extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationList(),
        appBar: AppBar(
          title: const Text("Manage Referral"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.white),
                      Text("Add Referral")
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Add_Referal()));
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
                        child: Textt(
                          text: "No Referrals Added! Add one to Proceed",
                          size: 16,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
