import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';

class MainJobDescprition extends StatelessWidget {
  List<JobsOverviewModel> getData;
  MainJobDescprition({this.getData});
  Widget jobTile(String quantity, String title, String subTitle) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 50, minWidth: 50),
              decoration: BoxDecoration(
                  color: AppColors.Yello_Box,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Center(
                  child: Text(
                quantity,
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      fontFamily: "RobotRegular", color: AppColors.Grey),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getData.length,
        itemBuilder: (BuildContext context, int index) {
          return getData[index].count != null
              ? jobTile(getData[index].count.toString(), getData[index].title,
                  getData[index].timestamp)
              : SizedBox(
                  height: 0,
                  width: 0,
                );
        },
      ),
    );
  }
}
