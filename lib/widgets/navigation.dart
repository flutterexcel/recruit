import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/Manage_Referral.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/show_referral.dart';
import 'package:flutter_product_recruit/screens/Notifications/setup_slack.dart';
import 'package:flutter_product_recruit/screens/conversation.dart';
import 'package:flutter_product_recruit/screens/jobsoverview.dart';
import 'package:flutter_product_recruit/screens/manage_emails/manage_emails.dart';

import 'package:flutter_product_recruit/screens/manage_sources/manage_sources.dart';
import 'package:flutter_product_recruit/screens/manage_spams/manage_spams.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/screens/permissions.dart';
import 'package:flutter_product_recruit/screens/users_list.dart';

import 'package:flutter_product_recruit/services/storage_service.dart';

class NavigationList extends StatefulWidget {
  var loginstate;

  NavigationList();
  @override
  _NavigationListState createState() => _NavigationListState();
}

class _NavigationListState extends State<NavigationList> {
  _NavigationListState();
  File _image;

  @override
  Widget build(BuildContext context) {
    // print("second drawer${this.loginstate}");
    // final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(StorageUtil.getUserName(),
                style: TextStyle(
                  fontSize: 20,
                )),
            accountEmail: Text(StorageUtil.getUserEmail(),
                style: TextStyle(
                  fontSize: 16,
                )),
            currentAccountPicture: CircleAvatar(
              backgroundImage: _image == null
                  ? NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQskE_K0tR332USgjzlAjZNS53Y84Nl9O1wMg&usqp=CAU")
                  : (NetworkImage(StorageUtil.getUserProfileImage())),
              // backgroundColor: Colors.orange,
              // child: Text(
              //   "A",
              //   style: TextStyle(fontSize: 40.0),
              // ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("MY ACCOUNT"),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => MyAccount()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text("JOBS"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => JobsOverview()));
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.inbox),
            title: Text("CONVERSATION "),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Conversation()));
              // Navigator.pop(context);
            },
          ),

          ///////////////////////////
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text("MANAGE SOURCES"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageSources()),
              );
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("USERS LIST"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => User_List()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text("USERS LOGS"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.refresh_sharp),
            title: Text("MANAGE Referrals"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Get_Referrals()));
            },
          ),
          ListTile(
            leading: Icon(Icons.error_outline_rounded),
            title: Text("MANAGE SPAMS"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Manage_Spams()));
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("PERMISSIONS"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Permis()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text("NOTIFICATION"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notificationss()));
            },
          ),
          ListTile(
            leading: Icon(Icons.email_sharp),
            title: Text("MANAGE EMAILS"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Manage_Emails()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("SETUP INTERVIEWS"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text("LOGOUT"),
            onTap: () {
              // loginstate.add(LogOutEvent);m,m,,
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
