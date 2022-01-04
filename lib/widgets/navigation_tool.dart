import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';

// ignore: must_be_immutable
class NavigationTool extends StatelessWidget {
  Image _iconData;
  String _titlr;
  IconData _icons;
  NavigationTool.iconData(this._icons, this._titlr);
  NavigationTool.iconImage(this._iconData, this._titlr);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _titlr,
        style: TextStyle(
          fontSize: 15,
          color: AppColors.Navigation_Text,
          fontFamily: 'RobotRegular',
        ),
      ),
      leading: _icons == null
          ? _iconData
          : Icon(
              _icons,
              color: AppColors.Icon_Color,
            ),
    );
  }
}
