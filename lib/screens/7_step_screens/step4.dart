// ignore_for_file: missing_return, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';

import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_bloc.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_event.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_state.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step3/step3.dart';

import 'package:flutter_product_recruit/screens/userlist/users_list.dart';
import 'package:flutter_product_recruit/widgets/button.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class Step4 extends StatefulWidget {
  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  /// final List<String> names = <String>['govind', 'text', 'Test', 'test123'];

  bool isHRSelected = true;
  //bool isIntervieweeSelected = true;

  @override
  Widget build(BuildContext context) {
    List list1 = [];
    List list2 = [];
    List<bool> _isIntSelected = List.generate(20, (i) => false);
    return BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
      if (state is UserListInitialState) {
        context.bloc<UserListBloc>().add(UserListInitialEvent());
        return SizedBox(height: 35, child: Loader());
      } else if (state is GetUserListState) {
        for (final hrList in state.userLists) {
          if (hrList.userType == "HR") {
            list1.add(hrList);
            print(list1.length);
          }
        }

        for (final interviweeList in state.userLists) {
          if (interviweeList.userType == "Interviewee") {
            list2.add(interviweeList);
            print(list2.length);
          }
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text("Create Job"),
            ),
            // drawer: NavigationList(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Contain(
                      outlinecolor: AppColors.grey,
                      borderrad: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 12.0, right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Textt(
                              text: "Manage Job Roles!",
                              size: 20,
                              fweight: FontWeight.bold,
                            ),
                            Textt(
                              text: "Step 4/7",
                              size: 10,
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // Text("Fill up the basic information regarding the job.",style: TextStyle(fontSize: 13),),

                            Row(
                              children: [
                                Textt(
                                  text: "Assign ",
                                  size: 13,
                                ),
                                Textt(
                                  text: "user ",
                                  size: 13,
                                  tcolor: AppColors.orange12,
                                ),
                                Textt(
                                  text:
                                      "who would be working on this job profile",
                                  size: 13,
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 1,
                            ),
                            Textt(
                              text:
                                  "by default all users are assigned to a job profile",
                              size: 13,
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            Contain(
                              //  height: 310,
                              width: 250,
                              outlinecolor: AppColors.grey,
                              borderrad: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Textt(
                                      text: "HRs",
                                      size: 13,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 170,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: list1.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Container(
                                                  // constraints: BoxConstraints(
                                                  //     minWidth: 100, maxWidth: 200),
                                                  // height: 40,
                                                  //  width: 140,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            AppColors.orange12),
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15.0),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: SvgPicture
                                                                .network(list1[
                                                                        index]
                                                                    .imageUrl),
                                                            radius: 18,
                                                          )),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Text(list1[index].name),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            Contain(
                              //  height: 310,
                              width: 250,
                              outlinecolor: AppColors.grey,
                              borderrad: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Textt(
                                      text: "Interviewee",
                                      size: 13,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 170,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: list2.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                ListTile(
                                                  title: Container(
                                                    // constraints: BoxConstraints(
                                                    //     minWidth: 100, maxWidth: 200),
                                                    // height: 40,
                                                    //  width: 140,

                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: _isIntSelected[
                                                                  index]
                                                              ? AppColors
                                                                  .orange12
                                                              : AppColors.grey),
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 15.0),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child: SvgPicture
                                                                  .network(list2[
                                                                          index]
                                                                      .imageUrl),
                                                              radius: 18,
                                                            )),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        Text(list2[index].name),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      _isIntSelected[index] =
                                                          !_isIntSelected[
                                                              index];
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Buttonn(
                                  text: "Back",
                                  bgcolor: AppColors.grey,
                                  borderRadius: 2,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Step3()));
                                  },
                                ),
                                Buttonn(
                                  text: "Next",
                                  bgcolor: AppColors.blue,
                                  borderRadius: 2,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => UsersList()));
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      }
    });
  }
}
