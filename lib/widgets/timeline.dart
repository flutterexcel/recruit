import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../app_colors.dart';

class TrackTimeLine extends StatelessWidget {
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
          // actions: [

          //   IconButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => TrackTimeLine()),
          //         );
          //       },
          //       icon: Icon(Icons.notifications, size: 32)),
          // ],
        ),
        body: Container(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, right: 5),
                              padding: EdgeInsets.all(5),
                              // decoration: BoxDecoration(
                              //     color: AppColors.Primary,
                              //     borderRadius: BorderRadius.circular(50)),
                              // child: Icon(Icons.circle_rounded,
                              //     color: AppColors.white)
                              child: Text("5:08pm",
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
                        height: 100,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text("Login Succesfully by 123",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          )
                        ]),
                      ))
                    ],
                  ));
                })));
  }
}
