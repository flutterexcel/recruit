import 'package:flutter/material.dart';

class TextField_Int extends StatelessWidget {
  String labelText;
  bool obscureText;
  Key key;
  TextEditingController controller;
  String hintText;
  bool autocorrect;
  double borderRadius;
  int maxLines;
  TextAlign textAlign;

  TextField_Int({
    this.controller,
    this.hintText,
    this.key,
    this.obscureText = false,
    this.labelText,
    this.autocorrect,
    this.borderRadius = 10.0,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      textAlign: textAlign,
      keyboardType: TextInputType.number,
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
      // validator: (value) {
      //   if (value.isEmpty) {
      //     //  Text("Entr $hintText");
      //     //return 'Enter $hintText';
      //   }
      //   return null;
      // },
    );
  }
}
