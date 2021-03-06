// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/screens/conversation/email_dialouge.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';

class Conversation extends StatefulWidget {
  Conversation();
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final GlobalKey _menuKey = GlobalKey();
  _ConversationState();
  void _popupEmailDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: EmailDialouge());
        });
  }

  @override
  Widget build(BuildContext context) {
    // print("manage source -${state}");

    return Scaffold(
      drawer: NavigationList(),
      appBar: AppBar(
        title: const Text(
          "Conversations",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: AppColors.blue,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 10,
              width: 48,
              child: InkWell(
                child: Icon(
                  Icons.attach_email_outlined,
                  color: AppColors.white,
                ),
                onTap: () {
                  _popupEmailDialog(context);
                },
              ),
              decoration: BoxDecoration(
                // border: Border.all(color: outlinecolor),
                color: AppColors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          )

          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //   child: TextButton.icon(
          //     style: TextButton.styleFrom(
          //       textStyle: TextStyle(color: AppColors.white),
          //       backgroundColor: AppColors.Primary,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(24.0),
          //       ),
          //     ),
          //     onPressed: () {},
          //     icon: Icon(Icons.message, color: AppColors.white),
          //     label: Text(""),
          //   ),
          // ),
          // add more IconButton
        ],
      ),

      //   SecondAppBar(text: "New   ", title: "Conversation"),
      body: Conversation(),
    );
  }

  Widget Conversation() {
    final button = PopupMenuButton(
      key: _menuKey,
      itemBuilder: (_) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          child: InkWell(
            onTap: () {
              print('Fetch New Mails');
            },
            child: Text('Fetch New Mails'),
          ),
        ),
        PopupMenuItem<String>(
          child: InkWell(
            onTap: () {
              print('Go To Inbox');
            },
            child: Text('Go To Inbox'),
          ),
        ),
      ],
      onSelected: (_) {},
      elevation: 8,
    );
    return Container(
        child: Column(
      children: [
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Conversation",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(width: 10),
              Container(
                  alignment: Alignment.center,
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  child: Text("0")),
            ]),
            button,
          ]),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusColor: Colors.grey[350],
                      prefixIcon: Icon(Icons.search, color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),

                      // border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: "Search..."),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(
                                22.0) //                 <--- border radius here
                            ),
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 7),
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFf6a609),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(80))),
                                ),
                                Expanded(
                                    child: Text("Jaswant Singh Khati",
                                        style: TextStyle(
                                            color: AppColors.darkGrey))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "jaswant@excellencetechnologies.info",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0XFFFa6aab4)),
                                  ),
                                )
                              ]),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 10.0),
                            child: Text(
                              "Jaswant Singh Khati your interview for First round of NodeJS Developer",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0XFFF3d3d3d)),
                            ),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.scale(
                                scale: 0.8,
                                child: ElevatedButton(
                                    child: Text("Angular Developer",
                                        style: TextStyle(fontSize: 14)),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.grey),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                side:
                                                    BorderSide(color: Colors.grey)))),
                                    onPressed: () => null),
                              ),
                              SizedBox(width: 15),
                              Transform.scale(
                                scale: 0.8,
                                child: ElevatedButton(
                                    child: Text("Reject",
                                        style: TextStyle(fontSize: 14)),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.red),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                side:
                                                    BorderSide(color: Colors.red)))),
                                    onPressed: () => null),
                              )
                            ],
                          )
                        ],
                      )),
                );
              }),
        ),
      ],
    ));
  }
}
