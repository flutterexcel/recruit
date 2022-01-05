import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';

class NavigationList extends StatefulWidget {
  @override
  _NavigationListState createState() => _NavigationListState();
}

class _NavigationListState extends State<NavigationList> {
  var currentPage;
  File _image;

  @override
  Widget build(BuildContext context) {
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
                  child: CircleAvatar(
                      radius: 14,
                      backgroundImage:
                          NetworkImage(StorageUtil.getUserProfileImage())),
                ))),
        menuItem(1, "JOBS", Icons.work,
            currentPage == DrawerSections.JOBS ? true : false),
        menuItem(2, "CONVERSATION", Icons.inbox,
            currentPage == DrawerSections.CONVERSATION ? true : false),
        menuItem(3, "STATISTICS", Icons.star_outline,
            currentPage == DrawerSections.STATISTICS ? true : false),
        menuItem(4, "CANDIDATE DATABASE", Icons.file_copy,
            currentPage == DrawerSections.CANDIDATEDATABASE ? true : false),

        menuItem(5, "Settings", Icons.settings_outlined,
            currentPage == DrawerSections.settings ? true : false),
        GestureDetector(
            onTap: () {},
            child: ListTile(
                // leading: Icon(Icons.ac_unit),
                title: Text(
                  "Log Out",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.logout),
                ))),
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
