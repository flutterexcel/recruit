// ignore_for_file: must_be_immutable

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';

class ExpandableCustom extends StatelessWidget {
  bool isIcon = false;
  IconData icon;
  String headerText;
  bool emailType;
  List<dynamic> expanded = [];
  ExpandableCustom(
      {this.isIcon, this.icon, this.headerText, this.expanded, this.emailType});
  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      //controller: ExpandableController(initialExpanded: true),
      header: Row(
        children: [],
      ),
      //collapsed: Center(),
      expanded: Column(
        children: [...expanded],
      ),
      // theme: ExpandableThemeData(
      //   iconPadding: EdgeInsets.only(top: 0),
      //   iconPlacement: ExpandablePanelIconPlacement.left,
      // ),
    );
  }
}
