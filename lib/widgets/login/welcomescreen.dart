import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Welcome to',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Recruit AI',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          textDirection: TextDirection.ltr,
        ),
        SizedBox(height: 15),
        Text(
          'Speed up your hiring with AI',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 15,
            fontFamily: 'RobotRegular',
          ),
          textDirection: TextDirection.ltr,
        ),
        SizedBox(height: 15),
        Text(
          'AI, Automation and Analytics',
          style: TextStyle(
            fontFamily: 'RobotRegular',
            color: Colors.red,
            fontSize: 15,
          ),
          textDirection: TextDirection.ltr,
        ),
      ]),
    );
  }
}
