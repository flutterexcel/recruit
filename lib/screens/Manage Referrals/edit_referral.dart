// ignore_for_file: must_be_immutable, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/model/manage_referral/get_referral_model.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/show_referral.dart';
import 'package:flutter_product_recruit/services/manage_referral/add_referral_services.dart';
import 'package:flutter_product_recruit/services/manage_referral/get_referal_services.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class EditReferral extends StatefulWidget {
  ReferralListModel update;
  EditReferral({this.update});

  @override
  State<EditReferral> createState() => _EditReferralState();
}

class _EditReferralState extends State<EditReferral> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    emailController.text = widget.update.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("update id --${widget.update}");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Edit Spam Contact',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontFamily: 'RobotRegular',
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'E-mail',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 5,
              ),
              TextInput(
                controller: emailController,
                borderRadius: 1,
                autocorrect: true,
                hintText: "E-mail",
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                height: 40,
                minWidth: 6,
                color: AppColors.Orange,
                child: Text(
                  'Update Contact',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () async {
                  var res = await Provider.of<AddReferralService>(context,
                          listen: false)
                      .editReferralEmail(
                          widget.update.id, emailController.text);
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
                    Utils.showSnackBar(context, res.message, AppColors.Orange);
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                              create: (context) => GetReferralEmailService(),
                              child: GetReferrals(),
                            )));

                    //   // GetReferrals();
                  }
                }),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
