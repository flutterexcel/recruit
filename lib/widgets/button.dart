import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/widgets/container.dart';

class Buttonn extends StatelessWidget {
  final String text;
  Function onTap;
  double leftPadding;
  double rightPadding;
  final bgcolor;
  double borderRadius;

  Buttonn(
      {this.text,
      this.onTap,
      this.leftPadding = 0.0,
      this.rightPadding = 15.0,
      this.bgcolor,
      this.borderRadius = 8.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Contain(
          height: 35,
          backcolor: bgcolor,
          borderrad: borderRadius,
          child: FlatButton(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              onPressed: onTap),
        ),
      ),
    );
  }
}
