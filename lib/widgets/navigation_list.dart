import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/app_colors.dart';
import 'package:flutter_product_recruit/screens/my_account.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';


class NavigationList extends StatefulWidget {
  @override
  _NavigationListState createState() => _NavigationListState();
}

class _NavigationListState extends State<NavigationList> {
  var currentPage;

  @override
  Widget build(BuildContext context) {
    var container;
    // if (currentPage == DrawerSections.dashboard) {
    //   container = DashboardPage();
    // } else if (currentPage == DrawerSections.contacts) {
    //   container = ContactsPage();
    // } else if (currentPage == DrawerSections.events) {
    //   container = EventsPage();
    // } else if (currentPage == DrawerSections.notes) {
    //   container = NotesPage();
    // } else if (currentPage == DrawerSections.settings) {
    //   container = SettingsPage();
    // } else if (currentPage == DrawerSections.notifications) {
    //   container = NotificationsPage();
    // } else if (currentPage == DrawerSections.privacy_policy) {
    //   container = PrivacyPolicyPage();
    // } else if (currentPage == DrawerSections.send_feedback) {
    //   container = SendFeedbackPage();
    // }
    return 
      
        Drawer(
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
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
      
        children: [
          Center(
              child: Container(
                
                // child: SvgPicture.network(
                //   StorageUtil.getLogo(),
                //   height: 60,
                //   fit: BoxFit.fill,
                // ),

              ),
            ),

            const SizedBox(height: 20,),


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
          // menuItem(6, StorageUtil.getUserName(),Icons.verified_user_outlined,
          //     currentPage == DrawerSections.USERNAME ? true : false),


              GestureDetector(
                onTap: () { Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => MyAccount()));
                },
                child: ListTile(
                    title: Text(
                      StorageUtil.getUserName(),
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.Navigation_Text,
                        fontFamily: 'RobotRegular',
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              NetworkImage(StorageUtil.getUserProfileImage())),
                    )))
        
        ],
      ),
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



