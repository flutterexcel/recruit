import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/user_logs_bloc/user_log_bloc.dart';
import 'package:flutter_product_recruit/bloc/user_logs_bloc/user_log_event.dart';
import 'package:flutter_product_recruit/bloc/user_logs_bloc/user_log_state.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

import '../app_colors.dart';

class TrackTimeLine extends StatelessWidget {
  var data;

  TrackTimeLine({this.data});
  @override
  Widget build(BuildContext context) {
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
                  child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15, right: 5),
                          padding: EdgeInsets.all(5),
                          child: Text(DateFormat('hh:mm a').format(date),
                              style: TextStyle(
                                fontSize: 15,
                              ))),
                      Container(
                        width: 3,
                        height: 60,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    decoration: BoxDecoration(color: AppColors.white,
                        // border: Border(
                        //     top: BorderSide(
                        //         width: 4, color: AppColors.Primary)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black38,
                          )
                        ]),
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Text(data.userLog[index].logMsg,
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                  ))
                ],
              ));
            }));
  }

  // Widget UserLogView(data) {
  //   print(data);

  // }
}
