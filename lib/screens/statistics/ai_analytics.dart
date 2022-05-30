import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';

import 'package:flutter_product_recruit/widgets/navigation_list.dart';

// ignore: must_be_immutable
class AIAnalytics extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationList(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.Black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "AI Analytics",
            style: TextStyle(color: AppColors.Black, fontSize: 23),
            textAlign: TextAlign.left,
          ),
        ),
        body: Container());
  }
}
