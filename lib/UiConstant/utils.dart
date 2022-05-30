import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text, Color color) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(text, style: TextStyle(fontSize: 16)),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: color,
            duration: const Duration(seconds: 2)),
      );

  // static showToast(String msg, Color bgColor) {
  //   return Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: bgColor,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }
}
