import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  String labelText;
  bool obscureText;
  Key key;
  TextEditingController controller;
  String hintText;
  bool autocorrect;
  double borderRadius;
  int maxLines;

  TextInput({
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
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
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
