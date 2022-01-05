import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';

class SecondAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  SecondAppBar({this.text, this.title});
  var text;
  var title;

  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.Black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: AppColors.Black, fontSize: 23),
        textAlign: TextAlign.left,
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: TextStyle(color: AppColors.white),
              backgroundColor: AppColors.Primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
            onPressed: () => {},
            icon: Icon(Icons.add, color: AppColors.white),
            label: Text(text, style: TextStyle(color: AppColors.white)),
          ),
        ),
      ],
    );
  }
}
