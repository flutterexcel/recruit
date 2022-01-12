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

      
}
