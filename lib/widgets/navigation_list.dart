// ignore_for_file: missing_required_param

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/show_referral.dart';
import 'package:flutter_product_recruit/screens/Notifications/setup_slack.dart';
import 'package:flutter_product_recruit/screens/conversation.dart';
import 'package:flutter_product_recruit/screens/jobsoverview.dart';
import 'package:flutter_product_recruit/screens/login.dart';
import 'package:flutter_product_recruit/screens/manage_emails/manage_emails.dart';
import 'package:flutter_product_recruit/screens/manage_sources/manage_sources.dart';
import 'package:flutter_product_recruit/screens/manage_spams/manage_spams.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/screens/permissions.dart';
import 'package:flutter_product_recruit/screens/users_list.dart';
import 'package:flutter_product_recruit/services/manage_referral/get_referal_services.dart';

import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:provider/provider.dart';

import 'jobs_overview/jobsoverviewpage.dart';

class NavigationList extends StatefulWidget {
  List<JobList> getData;
  List<JobsOverviewModel> jobsOverViewModel;
  List<ListJobTag> listJobTag;

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
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                        create: (context) => GetReferralEmailService(),
                        child: GetReferrals(),
                      )));
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.refresh_sharp),
          //   title: Text("MANAGE Referrals"),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => GetReferrals()));
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.error_outline_rounded),
            title: Text("MANAGE SPAMS"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ManageSpam()));
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
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ManageEmail()));
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
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
              loginBloc.add(LogOutEvent());
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
