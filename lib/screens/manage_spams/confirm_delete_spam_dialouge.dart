import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/services/manage_spam/delete_spam_services.dart';
import 'package:flutter_product_recruit/widgets/snackbar.dart';

// ignore: camel_case_types, must_be_immutable
class DeleteSpam extends StatelessWidget {
  String id;
  TextEditingController textEditingController;
  DeleteSpam({this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 150,
      width: MediaQuery.of(context).size.width - 150,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Are You Sure?',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontFamily: 'RobotRegular',
              ),
              //  textDirection: TextDirection.ltr,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'No',
                style: TextStyle(fontSize: 13),
              ),
              FlatButton(
                  height: 30,
                  minWidth: 4,
                  color: AppColors.Orange,
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 13),
                  ),
                  textColor: Colors.white,
                  onPressed: () async {
                    var res =
                        await Delete_Spam_Email_Service.DeleteSpamEmail(id);
                    print(res.status);
                    if (res.status != null) {
                      Utils.showSnackBar(context, res.status, AppColors.Orange);
                      Navigator.pop(context, 'Yes');
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
