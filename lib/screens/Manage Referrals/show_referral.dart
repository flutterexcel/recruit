import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/add_referal.dart';
import 'package:flutter_product_recruit/screens/manage_spams/add_new_spam_contact.dart';
import 'package:flutter_product_recruit/screens/manage_spams/confirm_delete_spam_dialouge.dart';
import 'package:flutter_product_recruit/screens/manage_spams/update_contact_dialouge.dart';
import 'package:flutter_product_recruit/services/manage_referral/get_referal.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable, camel_case_types
class Get_Referrals extends StatefulWidget {
  @override
  State<Get_Referrals> createState() => _Get_ReferralsState();
}

// ignore: camel_case_types
class _Get_ReferralsState extends State<Get_Referrals> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getReferral();
  }

  void getReferral() async {
    var res = await Get_Referral_Email_Service.getReferralEmail();
    data = res;
    // print(res[1].);
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Update_Contact());
        });
  }

  void _popupConfirmDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: DeleteSpam(id: id));
        });
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text("Add Referral"),
                  ],
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Add_Referal()));
                  });
                },
              ),
            ),
          ),
        ],
      ),
      // drawer: NavigationList(),s
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          var dater = data[index].createdAt;
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
                    child: Text(data[index].email[0].toString().toUpperCase()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Textt(
                    text: data[index].email,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Textt(
                    text: DateFormat('dd:MM:yyyy').format(dater),
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
                                _popupConfirmDialog(context, data[index].id);
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
    );
  }
}
