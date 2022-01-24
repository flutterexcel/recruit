// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldCentre extends StatelessWidget {
  String labelText;
  bool obscureText;
  Key key;
  TextEditingController controller;
  String hintText;
  bool autocorrect;
  double borderRadius;
  int maxLines;

  TextFieldCentre({
    this.controller,
    this.hintText,
    this.key,
    this.obscureText = false,
    this.labelText,
    this.autocorrect,
    this.borderRadius = 10.0,
    this.maxLines = 1,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      //keyboardType: TextInputType.multiline,
      // keyboardType: TextInputType.number,
      controller: controller,
      textAlign: TextAlign.center,
      maxLines: maxLines,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        labelText: labelText,
        hintStyle: TextStyle(
          fontFamily: 'RobotRegular',
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Enter $hintText';
        }
        return null;
      },
    );
  }
}
