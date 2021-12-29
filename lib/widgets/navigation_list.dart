import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/screens/login.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/widgets/navigation_tool.dart';
import 'package:flutter_svg/svg.dart';

import '../app_colors.dart';

class NavigationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);
    return Drawer(
      elevation: 3,
      child: Container(
        width: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: SvgPicture.network(
                  StorageUtil.getLogo(),
                  height: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: ListTile(
                    title: Text(
                      StorageUtil.getUserName(),
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.Navigation_Text,
                        fontFamily: 'RobotRegular',
                      ),
                    ),
                    leading: CircleAvatar(
                        radius: 16,
                        backgroundImage:
                            NetworkImage(StorageUtil.getUserProfileImage()))))
          ],
        ),
      ),
    );
  }
}
