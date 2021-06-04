import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_svg/svg.dart';

class LogoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Center(
          child: Container(
        child: SvgPicture.network(StorageUtil.getLogo(),
          height: 50,
          fit: BoxFit.fill,
        ),
      )),
    );
  }
}
