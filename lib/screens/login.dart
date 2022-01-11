import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/login/login_page.dart';

import 'jobsoverview.dart';

class Login extends StatelessWidget {
  String url;
  Login({this.url});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          // ignore: deprecated_member_use
          context.bloc<LoginBloc>().add(LoginInitialEvent());
          return Loader();
        } else if (state is LoginPageState || state is LoginFailure) {
          return LoginPage();
        } else if (state is LoginSuccess) {
          return MyAccount();
        }
        return Loader();
      },
    );
  }
}
