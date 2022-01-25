// ignore_for_file: deprecated_member_use, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/services/manage_spam/manage_spam_service.dart';

// ignore: camel_case_types, must_be_immutable
class DeleteSpam extends StatelessWidget {
  String id;
  TextEditingController textEditingController;
  DeleteSpam({this.id});

  @override
  Widget build(BuildContext context) {
    print("delete id=$id");
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
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
                child: Text(
                  'No',
                  style: TextStyle(fontSize: 13),
                ),
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
                    DeleteSpamModel res =
                        await ManageSpamService.DeleteSpamService(id);
                    print(res.status);
                    if (res.status == 'SUCCESS') {
                      Utils.showSnackBar(
                          context, "Succesfully Deleted", AppColors.Orange);
                      context
                          .bloc<ManageSpamBloc>()
                          .add(ManageSpamInitialEvent());
                    } else {
                      Utils.showSnackBar(
                          context, "Invalid Id", AppColors.Orange);
                    }
                    Navigator.pop(context, 'Yes');
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
