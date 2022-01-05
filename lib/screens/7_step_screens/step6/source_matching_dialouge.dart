import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';

class Source_Matching extends StatelessWidget {
  TextEditingController textEditingController;
  Source_Matching({this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 220,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Source Matching',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Stage Name',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 5,
              ),
              TextInput(
                autocorrect: true,
                hintText: "Stage",
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                height: 40,
                minWidth: 6,
                color: AppColors.Orange,
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 13),
                ),
                textColor: Colors.white,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
