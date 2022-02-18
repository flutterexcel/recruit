// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
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
          context.bloc<LoginBloc>().add(LoginInitialEvent());
          return Loader1();
        } else if (state is LoginPageState || state is LoginFailure) {
          return LoginPage();
        } else if (state is LoginSuccess) {
          return JobsOverview();
          // return Manage_Spams();
        } else if (state is LoginState) {
          return LoginPage();
        }
        return Loader();
      },
    );
  }
}
