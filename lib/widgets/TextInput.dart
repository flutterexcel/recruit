import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  String labelText;
  bool obscureText;
  Key key;
  TextEditingController controller;
  String hintText;
  TextInput({this.controller, this.hintText, this.key, this.obscureText,this.labelText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
          fontFamily: 'RobotRegular',
        ),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
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
