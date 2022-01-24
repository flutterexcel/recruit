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

  TextInputType keyboardtype;

  Function validateText;
  Container img;

  int maxLength;

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
    this.validateText,
    this.maxLength,
    this.img,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardtype,
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(fontStyle: fstyle),
      maxLength: maxLength,
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
      validator: validateText,
    );
  }
}
