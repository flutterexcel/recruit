// ignore_for_file: missing_return, deprecated_member_use, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_bloc.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_event.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/delete_userlist_model.dart';
import 'package:flutter_product_recruit/screens/userlist/add_new_user.dart';
import 'package:flutter_product_recruit/screens/userlist/change_password_dialouge.dart';
import 'package:flutter_product_recruit/screens/userlist/manage_jobs_dialouge.dart';
import 'package:flutter_product_recruit/services/userlist_services/activate_user_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/deactivate_user_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/delete_userlist_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/job_role_update_service.dart';

import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable, camel_case_types
class UsersList extends StatefulWidget {
  @override
  State<UsersList> createState() => _UsersListState();
}

// ignore: camel_case_types
class _UsersListState extends State<UsersList> {
  // bool isSwitched = false;

  List data = [];
  List<bool> isSwitched = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  // List<bool> isSwitched = [];

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
  @override
  void initState() {
    super.initState();
    print(BlocProvider.of<UserListBloc>(context).state);
  }

  void _popupDialog(BuildContext context, id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: ManageJobsDialouge(userId: id));
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
        // for (final hrList in state.userLists) {
        //   if (hrList.userType == "HR") {
        //     list1.add(hrList);
        //     print(list1.length);
        //   }
        // }

        return Scaffold(
          drawer: NavigationList(),
          appBar: SecondAppBar(
              text: "Add User",
              title: "All Users",
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddNewUser()));
              }),
          body: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.userLists.length - 1,
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
                        backgroundColor: Colors.white,
                        child: SvgPicture.network(
                            state.userLists[index + 1].imageUrl),
                        radius: 35,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Textt(text: state.userLists[index + 1].name),
                      const SizedBox(
                        height: 10,
                      ),
                      Textt(
                        text: state.userLists[index + 1].email,
                        tcolor: AppColors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Textt(
                          text: state.userLists[index + 1].userType.toString(),
                          size: 13,
                          tcolor: state.userLists[index + 1].activeStatus
                              ? AppColors.orange12
                              : AppColors.grey),
                      const SizedBox(
                        height: 10,
                      ),
                      state.userLists[index + 1].userType == 'Admin'
                          ? SizedBox(
                              height: 10,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Textt(
                                //   text: state.userLists[index + 1].userType !=
                                //           'Admin'
                                //       ? "${state.userLists[index + 1].jobProfiles.length} jobs"
                                //       : '',
                                // ),
                                Textt(
                                    text: state.userLists[index + 1]
                                                .jobProfiles ==
                                            null
                                        ? ""
                                        : "${state.userLists[index + 1].jobProfiles.length} Jobs"),
                                const SizedBox(
                                  width: 5,
                                ),
                                // InkWell(
                                //   child: Icon(isSwitched[index + 1]
                                //       ? Icons.arrow_drop_up
                                //       : Icons.arrow_drop_down),
                                //   onTap: () {
                                //     setState(() {
                                //       isSwitched[index + 1] =
                                //           !isSwitched[index + 1];
                                //     });
                                //   },
                                // ),
                                // InkWell(
                                //   child:
                                //       state.userLists[index + 1].jobProfiles ==
                                //               null
                                //           ? SizedBox()
                                //           : Icon(isSwitched[index + 1]
                                //               ? Icons.arrow_drop_up
                                //               : Icons.arrow_drop_down),
                                //   onTap: () {
                                //     print(isSwitched[index + 1]);
                                //     setState(() {
                                //       isSwitched[index + 1] =
                                //           !isSwitched[index + 1];
                                //       print(isSwitched[index + 1]);
                                //       isSwitched = List.generate(
                                //           state.userLists.length,
                                //           (index) => isSwitched[index]);
                                //       ;
                                //       print(isSwitched);
                                //     });
                                //   },
                                // ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      // isSwitched[index + 1]
                      //     ?
                      state.userLists[index + 1].jobProfiles != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 15,

                                  // mainAxisSpacing: 5,
                                  // childAspectRatio: MediaQuery.of(context)
                                  //         .size
                                  //         .width *
                                  //     2 /
                                  //     (MediaQuery.of(context).size.height / 3),
                                ),
                                itemCount:
                                    state.userLists[index + 1].jobProfiles !=
                                            null
                                        ? state.userLists[index + 1].jobProfiles
                                            .length
                                        : 0,
                                itemBuilder: (context, index2) {
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
                                                      state.userLists[index + 1]
                                                          .jobProfiles[index2]
                                                          .toString(),
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
                            icon: Icon(Icons.power_settings_new_outlined),
                            // key: _menuKey,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              state.userLists[index + 1].activeStatus
                                  ? PopupMenuItem<String>(
                                      child: InkWell(
                                        child: Text('Deactivate'),
                                      ),
                                      onTap: () async {
                                        DeactivateUserModel res =
                                            await DeactivateUserService
                                                .deactivateUser(state
                                                    .userLists[index + 1].id);
                                        //print(res.status);
                                        if (res.message != null) {
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
                                        //  Navigator.pop(context, 'Yes');
                                      },
                                    )
                                  : PopupMenuItem<String>(
                                      child: InkWell(
                                        child: Text('Activate'),
                                      ),
                                      onTap: () async {
                                        DeactivateUserModel res =
                                            await ActivateUserService
                                                .activateUser(state
                                                    .userLists[index + 1].id);
                                        //print(res.status);
                                        if (res.message != null) {
                                          Utils.showSnackBar(
                                              context,
                                              "Succesfully Activated",
                                              AppColors.Green);
                                          context
                                              .bloc<UserListBloc>()
                                              .add(UserListInitialEvent());
                                        } else {
                                          Utils.showSnackBar(context,
                                              "Invalid Id", AppColors.Red);
                                        }
                                        //  Navigator.pop(context, 'Yes');
                                      },
                                    ),
                              PopupMenuItem<String>(
                                child: InkWell(
                                  child: Text('Delete'),
                                ),
                                onTap: () async {
                                  print(
                                      "id---${state.userLists[index + 1].id}");

                                  DeleteUserModel res =
                                      await DeleteUserService.deleteUser(
                                          state.userLists[index + 1].id);
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
                            child: Icon(Icons.https_outlined),
                            onTap: () {
                              _popupChangePassDialog(context);
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Icon(Icons.work_outline_outlined),
                            onTap: () {
                              state.userLists[index + 1].userType != 'Admin'
                                  ? _popupDialog(
                                      context, state.userLists[index + 1].id)
                                  : "";
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          PopupMenuButton(
                            // key: _menuKey,
                            itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                onTap: () async {
                                  print("id---${state.userLists[index].id}");

                                  JobRoleUpdateModel res =
                                      await JobRoleUpdateService.roleUpdate(
                                          state.userLists[index + 1].id,
                                          "Admin");
                                  //print(res.status);
                                  if (res.data.message != null) {
                                    Utils.showSnackBar(
                                        context,
                                        "Job Role Succesfully Updated",
                                        AppColors.Green);
                                    context
                                        .bloc<UserListBloc>()
                                        .add(UserListInitialEvent());
                                  } else {
                                    Utils.showSnackBar(
                                        context, "Invalid Id", AppColors.Red);
                                  }
                                },
                                child: InkWell(child: Text('Admin')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () async {
                                  print(
                                      "id---${state.userLists[index + 1].id}");

                                  JobRoleUpdateModel res =
                                      await JobRoleUpdateService.roleUpdate(
                                          state.userLists[index + 1].id, "HR");
                                  //print(res.status);
                                  if (res.data.message != null) {
                                    Utils.showSnackBar(
                                        context,
                                        "Job Role Succesfully Updated",
                                        AppColors.Green);
                                    context
                                        .bloc<UserListBloc>()
                                        .add(UserListInitialEvent());
                                  } else {
                                    Utils.showSnackBar(
                                        context, "Invalid Id", AppColors.Red);
                                  }
                                },
                                child: InkWell(child: Text('HR')),
                              ),
                              PopupMenuItem<String>(
                                onTap: () async {
                                  print("id---${state.userLists[index].id}");

                                  JobRoleUpdateModel res =
                                      await JobRoleUpdateService.roleUpdate(
                                          state.userLists[index + 1].id,
                                          "Interviewee");
                                  //print(res.status);
                                  if (res.data.message != null) {
                                    Utils.showSnackBar(
                                        context,
                                        "Job Role Succesfully Updated",
                                        AppColors.Green);
                                    context
                                        .bloc<UserListBloc>()
                                        .add(UserListInitialEvent());
                                  } else {
                                    Utils.showSnackBar(
                                        context, "Invalid Id", AppColors.Red);
                                  }
                                },
                                child: InkWell(child: Text('Interviewee')),
                              ),
                            ],
                            onSelected: (value11) {
                              print(value11);
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
