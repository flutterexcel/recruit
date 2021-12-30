import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/domain_bloc/domain_bloc.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/login.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/login/welcomescreen.dart';

final _domainFormKey = GlobalKey<FormState>();

class DomainLogin extends StatefulWidget {
  @override
  _DomainLoginState createState() => _DomainLoginState();
}

class _DomainLoginState extends State<DomainLogin> {
  TextEditingController domainController =
      new TextEditingController(text: "DevRecruit");
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DomainBloc, DomainState>(
      builder: (context, state) {
        if (state is DomainInitial) {
          context.bloc<DomainBloc>().add(DomainInitialEvenet());
          return Loader();
        }
        if (state is DomainFailure || state is DomainLoginState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                WelcomeScreen(),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: state is DomainLoginState
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter Your Domain Name',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 15,
                                  fontFamily: 'RobotRegular',
                                ),
                                textDirection: TextDirection.ltr,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Form(
                                key: _domainFormKey,
                                child: TextInput(
                                  obscureText: false,
                                  hintText: "Enter Domain",
                                  controller: domainController,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FlatButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  color: Color(0xFF7CACFB),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 147),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    if (_domainFormKey.currentState
                                        .validate()) {
                                      context.bloc<DomainBloc>().add(
                                          LoginWIthDomain(
                                              domain: domainController.text));
                                    }
                                  }),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: AppColors.WARINING_LIGHT,
                                      border:
                                          Border.all(color: AppColors.Orange),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        " It looks like your account is not active. Please contact support to get it activated. ",
                                        style: TextStyle(
                                            color: AppColors.Orange),
                                      ),
                                    ),
                                  )),
                                  const SizedBox(height: 10),
                              FlatButton(
                                  color: Color(0xFF7CACFB),
                                  
                                  child: Text(
                                    'Login Again',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    context
                                        .bloc<DomainBloc>()
                                        .add(ReLoginWithDomain());
                                  }),
                            ],
                          ))
              ],
            ),
          );
        } else if (state is DomainSuccess) {
          return Login(
            url: state.domainModel.image.faviconImage,
          );
        }
        return Loader();
      },
    );
  }
}
