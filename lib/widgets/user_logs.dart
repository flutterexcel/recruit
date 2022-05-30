import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../UiConstant/app_colors.dart';

// ignore: must_be_immutable
class TrackTimeLine extends StatelessWidget {
  var data;

  TrackTimeLine({this.data});
  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          iconTheme: IconThemeData(color: AppColors.Black),
          backgroundColor: AppColors.Primary,
          elevation: 0,
          title: Text(
            'User Timeline',
            style: TextStyle(color: AppColors.white, fontSize: 24),
            textAlign: TextAlign.left,
          ),
        ),
        body: ListView.builder(
            itemCount: data.userLog.length,
            itemBuilder: (context, index) {
              var date = data.userLog[index].createdAt;
              // String time = "${date.hour}:${date.minute}:${date.second}";

              return Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(DateFormat('hh:mm a').format(date),
                                style: TextStyle(
                                  fontSize: 15,
                                ))),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 2,
                          height: 70,
                          color: Color(0xFFFf6a609),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 15),
                        height: 70,
                        child: Text(
                          data.userLog[index].logMsg,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  // Widget UserLogView(data) {
  //   print(data);

  // }
}
