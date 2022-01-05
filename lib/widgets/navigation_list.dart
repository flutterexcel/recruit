import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_product_recruit/bloc/user_logs_bloc/user_log_state.dart';
import 'package:flutter_product_recruit/model/jobs_overview/joblist.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobs_overview.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/screens/conversation.dart';
import 'package:flutter_product_recruit/screens/jobsoverview.dart';
import 'package:flutter_product_recruit/screens/manage_sources.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';

import 'jobs_overview/jobsoverviewpage.dart';

class NavigationList extends StatefulWidget {
  List<JobList> getData;
  List<JobsOverviewModel> jobsOverViewModel;
  List<ListJobTag> listJobTag;

  NavigationList(this.getData, this.jobsOverViewModel, this.listJobTag);
  @override
  _NavigationListState createState() =>
      _NavigationListState(getData, jobsOverViewModel, listJobTag);
}

class _NavigationListState extends State<NavigationList> {
  List<JobList> getData;
  List<ListJobTag> listJobTag;
  List<JobsOverviewModel> jobsOverViewModel;

  _NavigationListState(
    this.getData,
    this.jobsOverViewModel,
    this.listJobTag,
  );
  var currentPage;
  File _image;

  @override
  Widget build(BuildContext context) {
    // final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    // print(
    //     "getdata---${getData},joboverviewmodel----${jobsOverViewModel} and listjobtag----${listJobTag}");
    var container;

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyDrawerList(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Column(
      children: [
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
        GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => MyAccount()));
            },
            child: ListTile(
                // leading: Icon(Icons.ac_unit),
                title: Text(
                  "My Account",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.person, color: Colors.black),
                ))),
        GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => JobsOverview()));
            },
            child: ListTile(
                // leading: Icon(Icons.ac_unit),
                title: Text(
                  "JOBS",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                ))),

        GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => Conversation()));
            },
            child: ListTile(
                // leading: Icon(Icons.ac_unit),
                title: Text(
                  "CONVERSATION",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.inbox, color: Colors.black),
                ))),
        menuItem(3, "STATISTICS", Icons.star_outline,
            currentPage == DrawerSections.STATISTICS ? true : false),
        menuItem(4, "CANDIDATE DATABASE", Icons.file_copy,
            currentPage == DrawerSections.CANDIDATEDATABASE ? true : false),

        GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => ManageSources()));
            },
            child: ListTile(
                // leading: Icon(Icons.ac_unit),
                title: Text(
                  "SETTINGS",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.settings, color: Colors.black),
                ))),

        // GestureDetector(
        //     onTap: () {
        //       // loginBloc.add(LogOutEvent());
        //     },
        //     child: ListTile(
        //         // leading: Icon(Icons.ac_unit),
        //         title: Text(
        //           "Log Out",
        //           style: const TextStyle(
        //             color: Colors.black,
        //             fontSize: 16,
        //           ),
        //         ),
        //         leading: Padding(
        //           padding: const EdgeInsets.only(left: 20.0),
        //           child: Icon(Icons.logout, color: Colors.black),
        //         ))),
        // menuItem(6, StorageUtil.getUserName(),Icons.verified_user_outlined,
        //     currentPage == DrawerSections.USERNAME ? true : false),
      ],
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.JOBS;
            } else if (id == 2) {
              currentPage = DrawerSections.CONVERSATION;
            } else if (id == 3) {
              currentPage = DrawerSections.STATISTICS;
            } else if (id == 4) {
              currentPage = DrawerSections.CANDIDATEDATABASE;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            }
            // else if (id == 6) {
            //   currentPage = DrawerSections.USERNAME;
            // }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  JOBS,
  CONVERSATION,
  STATISTICS,
  CANDIDATEDATABASE,
  settings,
  //USERNAME,

}
