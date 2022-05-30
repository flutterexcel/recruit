import 'package:flutter/material.dart';

import 'loginform.dart';
import 'logo_screen.dart';
import 'welcomescreen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          LogoScreen(),
          WelcomeScreen(),
          LoginForm(),
        ],
      ),
    ));
  }
}
