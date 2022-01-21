// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_bloc.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_event.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/delete_userlist_model.dart';
import 'package:flutter_product_recruit/screens/add_new_user.dart';
import 'package:flutter_product_recruit/screens/userlist/change_password_dialouge.dart';
import 'package:flutter_product_recruit/screens/userlist/manage_jobs_dialouge.dart';
import 'package:flutter_product_recruit/services/userlist_services/deactivate_user_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/delete_userlist_service.dart';

import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable, camel_case_types
class UsersList extends StatefulWidget {
  @override
  State<UsersList> createState() => _UsersListState();
}

// ignore: camel_case_types
class _UsersListState extends State<UsersList> {
  bool isSwitched = false;
  List data = [];
  String _value = "Delete";
  final GlobalKey _menuKey = GlobalKey();

  // @override
  // void initState() {
  //   super.initState();
  //   getUserList();
  // }

  // void getUserList() async {
  //   var res = await GetUserListService.getUserList();
  //   data = res;
  //   //print(res[1].userType.toString());
  // }
  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: ManageJobsDialouge());
        });
  }

  void _popupChangePassDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: ChangePass());
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
      if (state is UserListInitialState) {
        context.bloc<UserListBloc>().add(UserListInitialEvent());
        return Loader1();
      } else if (state is GetUserListState) {
        // print("state----${state}");
        return Scaffold(
          appBar: SecondAppBar(
              text: "Add User",
              title: "All Users",
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddNewUser()));
              }),
          body: ListView.separated(
            shrinkWrap: true,
            itemCount: state.userLists.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  outlinecolor: AppColors.grey,
                  borderrad: 8,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        child: Image.network(
                          "${state.userLists[index].imageUrl}",
                          fit: BoxFit.contain,
                        ),
                        radius: 25,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Textt(text: state.userLists[index].name),
                      const SizedBox(
                        height: 10,
                      ),
                      Textt(
                        text: state.userLists[index].email,
                        tcolor: AppColors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Textt(
                          text: state.userLists[index].userType.toString(),
                          size: 13,
                          tcolor: state.userLists[index].activeStatus
                              ? AppColors.orange12
                              : AppColors.grey),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Textt(
                            text: "21 jobs",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Icon(isSwitched
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                            onTap: () {
                              setState(() {
                                isSwitched = !isSwitched;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isSwitched
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 5,
                                  // childAspectRatio: MediaQuery.of(context)
                                  //         .size
                                  //         .width *
                                  //     2 /
                                  //     (MediaQuery.of(context).size.height / 3),
                                ),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    child: Contain(
                                      //  height: 30,
                                      borderrad: 20,
                                      outlinecolor: AppColors.grey,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Angular Developer',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          InkWell(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.lightGrey),
                                              ),
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                              ),
                            )
                          : const SizedBox(
                              height: 2,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PopupMenuButton(
                            icon: Icon(Icons.delete),
                            // key: _menuKey,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                child: InkWell(
                                    onTap: () async {
                                      DeactivateUserModel res =
                                          await DeactivateUserService
                                              .deactivateUser(
                                                  state.userLists[index].id);
                                      //print(res.status);
                                      if (res.message == "User Deactivated") {
                                        Utils.showSnackBar(
                                            context,
                                            "Succesfully Deactivated",
                                            AppColors.Green);
                                        context
                                            .bloc<UserListBloc>()
                                            .add(UserListInitialEvent());
                                      } else {
                                        Utils.showSnackBar(context,
                                            "Invalid Id", AppColors.Red);
                                      }
                                    },
                                    child: Text('Deactivate')),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  child: Text('Delete'),
                                ),
                                onTap: () async {
                                  print("id---${state.userLists[index].id}");

                                  DeleteUserModel res =
                                      await DeleteUserService.deleteUser(
                                          state.userLists[index].id);
                                  //print(res.status);
                                  if (res.message != null) {
                                    Utils.showSnackBar(context,
                                        "Succesfully Deleted", AppColors.Green);
                                    context
                                        .bloc<UserListBloc>()
                                        .add(UserListInitialEvent());
                                  } else {
                                    Utils.showSnackBar(
                                        context, "Invalid Id", AppColors.Red);
                                  }
                                  //  Navigator.pop(context, 'Yes');
                                },
                              ),
                            ],
                            onSelected: (value) {},
                            elevation: 8,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Icon(Icons.usb_off_rounded),
                            onTap: () {
                              _popupChangePassDialog(context);
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Icon(Icons.local_post_office),
                            onTap: () {
                              _popupDialog(context);
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          PopupMenuButton(
                            // key: _menuKey,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('Admin');
                                  },
                                  child: Text('Admin'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('HR');
                                  },
                                  child: Text('HR'),
                                ),
                              ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  onTap: () {
                                    print('Interviewee');
                                  },
                                  child: Text('Interviewee'),
                                ),
                              ),
                            ],
                            onSelected: (value) {
                              setState(() {
                                _value = value;
                                print(_value);
                              });
                            },
                            elevation: 8,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        );
      }
    });
  }
}
