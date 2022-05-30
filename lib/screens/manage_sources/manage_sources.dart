// ignore_for_file: non_constant_identifier_names, missing_return, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/managesource_bloc/managesource_bloc.dart';
import 'package:flutter_product_recruit/bloc/managesource_bloc/managesource_event.dart';
import 'package:flutter_product_recruit/bloc/managesource_bloc/managesource_state.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/add_source.dart';
import 'package:flutter_product_recruit/screens/manage_sources/source_fetch_from_dialouge.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/text.dart';

class ManageSources extends StatefulWidget {
  ManageSources();
  @override
  _ManageSourcesState createState() => _ManageSourcesState();
}

class _ManageSourcesState extends State<ManageSources> {
  String dropdownvalue = 'New Mails';

  // List of items in our dropdown menu
  var items = [
    'New Mails',
    'Old Mails',
  ];
  _ManageSourcesState();
  void _popupManageSourceFetchFromDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: SourceFetchFromDialouge());
        });
  }

  @override
  Widget build(BuildContext context) {
    // print("manage source -${state}");

    void OnPressed() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddSource()));
    }

    return BlocBuilder<ManageSourceBloc, ManageSourceState>(
        builder: (context, state) {
      if (state is ManageSourceInitialState) {
        context.bloc<ManageSourceBloc>().add(ManageSourceInitialEvent());
        return SizedBox(height: 5, child: Loader());
      } else if (state is GetManageSourceState) {
        //  print("statessss----$state");
        print(state.managesourcelists.length);

        return Scaffold(
          drawer: NavigationList(),
          appBar: SecondAppBar(
              text: "Add Source",
              title: "Manage Sources",
              onPressed: OnPressed),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Contain(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    borderrad: 5,
                    outlinecolor: AppColors.grey,
                    child: Column(
                      children: [
                        Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 170,
                                    width: double.infinity,
                                    color: AppColors.Green,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                    .managesourcelists[0].email,
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    color: AppColors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "18 hours ago",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    color: AppColors.white),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${state.managesourcelists[0].fetchedEmailCount}/${state.managesourcelists[0].totalEmails} (${state.managesourcelists[0].fetchedMailFrom} - ${state.managesourcelists[0].fetchedMailTill})",
                                            style: TextStyle(
                                                fontSize: 19,
                                                color: AppColors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    //width: 260,
                                    height: 10,
                                    color: AppColors.orange12,
                                  ),
                                  Container(
                                    //width: 260,
                                    height: 21,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/gmaill.png'),
                                  radius: 28,
                                ),
                              ),
                            ]),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              Icon(Icons.remove),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.refresh),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.power),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                child: Icon(Icons.email_outlined),
                                onTap: () {
                                  _popupManageSourceFetchFromDialog(context);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Contain(
                    width: MediaQuery.of(context).size.width,
                    height: 340,
                    borderrad: 5,
                    outlinecolor: AppColors.grey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Textt(
                                  text: "Email Fetched",
                                  size: 18,
                                  fweight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                child: DefaultTabController(
                                  length: 3,
                                  child: TabBar(
                                    labelColor: Color(0xFF00E5FF),
                                    indicatorColor: Color(0xFF00E5FF),
                                    unselectedLabelColor: Colors.black,
                                    labelStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    tabs: <Widget>[
                                      Text(
                                        "Day",
                                        textScaleFactor: 0.7,
                                      ),
                                      Text(
                                        "Month",
                                        textScaleFactor: 0.7,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          isExpanded: true,

                                          value: dropdownvalue,

                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownvalue = newValue;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
