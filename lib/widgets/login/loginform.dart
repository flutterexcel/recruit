import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/forgot_dialogue.dart';

import '../../UiConstant/app_colors.dart';

final _loginFormKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController =
      new TextEditingController(text: "testing1@gmail.com");
  TextEditingController passwordController =
      new TextEditingController(text: "testing1");

  bool _rememberme = false;

  @override
  Widget build(BuildContext context) {
    void _popupDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: ForgotDialogue());
          });
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: _loginFormKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextInput(
                      labelText: "Email",
                      obscureText: false,
                      controller: emailController,
                      hintText: "Email",
                    ),
                    key: Key('email'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TextInput(
                      labelText: "Password",
                      obscureText: true,
                      controller: passwordController,
                      hintText: "Password",
                    ),
                    key: Key('password'),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberme,
                  onChanged: (bool value) {
                    setState(() {
                      _rememberme = value;
                      if (value) {
                        StorageUtil.setUserEmail(emailController.text);
                        StorageUtil.setPassword(passwordController.text);
                      } else if (!value) {
                        StorageUtil.setUserEmail("");
                        StorageUtil.setPassword("");
                      }
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Remember Me',
                    style: TextStyle(
                        fontFamily: 'RobotRegular', color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerRight,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        _popupDialog(context);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'RobotRegular', color: Colors.black),
                      )),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Color(0xFF7CACFB),
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    if (_loginFormKey.currentState.validate()) {
                      // ignore: deprecated_member_use
                      context.bloc<LoginBloc>().add(LoginWithEmail(
                          emailController.text, passwordController.text));
                    }
                  }),
            ),
            state is LoginFailure
                ? Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.WARINING_LIGHT,
                      border: Border.all(color: AppColors.Orange),
                    ),
                    child: Center(
                      child: Text(
                        "Invalid Login Details, Try Again",
                        style: TextStyle(color: AppColors.Orange),
                      ),
                    ),
                  )
                : Center()
          ],
        );
      },
    );
  }
}
