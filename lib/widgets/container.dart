// ignore_for_file: avoid_init_to_null, must_be_immutable

import 'package:flutter/material.dart';

class Contain extends StatelessWidget {
  final double borderrad;
  Widget child;
  final double height;
  final double width;
  final backcolor;
  final outlinecolor;

  Contain(
      {this.borderrad,
      this.child,
      this.width = null,
      this.backcolor = Colors.white,
      this.height = null,
      this.outlinecolor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: outlinecolor),
          color: backcolor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(borderrad)),
        ),
        child: child);
  }
}
