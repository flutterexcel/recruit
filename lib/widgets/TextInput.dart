import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  String labelText;
  bool obscureText;
  Key key;
  TextEditingController controller;
  String hintText;
  bool autocorrect;
  double borderRadius;
  int maxLines;
  FontStyle fstyle;
  Container img;

  TextInputType keyboardtype;

  TextInput({
    this.controller,
    this.hintText,
    this.key,
    this.obscureText = false,
    this.labelText,
    this.autocorrect,
    this.borderRadius = 10.0,
    this.maxLines = 1,
    this.fstyle,
    this.keyboardtype,
    this.img = null,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(fontStyle: fstyle),
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: img,
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
      //     return 'Enter $hintText';
      //   }
      //   return null;
      // },
    );
  }
}
