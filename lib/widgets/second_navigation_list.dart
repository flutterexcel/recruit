import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_product_recruit/screens/manage_sources.dart';
import 'package:flutter_product_recruit/screens/users_list.dart';

import 'package:flutter_product_recruit/services/storage_service.dart';

class SecondNavigationList extends StatefulWidget {
  var loginstate;

  SecondNavigationList();
  @override
  _SecondNavigationListState createState() => _SecondNavigationListState();
}

class _SecondNavigationListState extends State<SecondNavigationList> {
  _SecondNavigationListState();
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
            leading: Icon(Icons.error_outline_rounded),
            title: Text("MANAGE SPAMS"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("PERMISSIONS"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text("NOTIFICATION"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.email_sharp),
            title: Text("MANAGE EMAILS"),
            onTap: () {
              Navigator.pop(context);
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
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text("MY JOBS"),
            onTap: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (BuildContext context) => ManageSources()));
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
