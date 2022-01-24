import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_bloc.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_events.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step1/add_source.dart';
import 'package:flutter_product_recruit/services/userlist_services/get_userlist_service.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../app_colors.dart';

class UserLogs extends StatefulWidget {
  UserLogs();
  @override
  _UserLogsState createState() => _UserLogsState();
}

class _UserLogsState extends State<UserLogs> {
  final ScrollController _controllerOne = ScrollController();

  DateTime selectedDate = DateTime.now();
  bool ispressed = false;
  String _chosenValue;
  // String _range = DateFormat('MMM dd').format(DateTime.now());
  String _range = 'Select Date';
  final DateRangePickerController _controller = DateRangePickerController();

  _UserLogsState();
  List<UserListsModel> userslist = [];

  @override
  void initState() {
    var user = getUserList();

    super.initState();
  }

  getUserList() async {
    userslist = await GetUserListService.getUserList();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        print("${args.value.startDate} to ${args.value.endDate}");

            _range = '${DateFormat('MMM dd').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('MMM dd').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
      } else {}
    });
  }








  void _datepicker(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
            height: 300,
            child: SfDateRangePicker(
              showActionButtons: true,
              onSubmit: (Object value) {
                // print(value);
                Navigator.pop(context);
              },
              onCancel: () {
                Navigator.pop(context);
              },
              rangeSelectionColor: Colors.blue,
              view: DateRangePickerView.month,
              monthViewSettings: DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1,
              ),
              controller: _controller,
              confirmText: "OK",
              startRangeSelectionColor: Colors.pink,
              endRangeSelectionColor: Colors.pink,
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                  DateTime.now().subtract(const Duration(days: 4)),
                  DateTime.now().add(const Duration(days: 2))),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    // print("manage source -${state}");

    return BlocBuilder<AllUserLogBloc, AllUserLogState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is AllUserLogInitialState) {
          // ignore: deprecated_member_use
          context.bloc<AllUserLogBloc>().add(AllUserLogDropdown());
          // context.bloc<AllUserLogBloc>().add(AllUserLogInitialEvent());
          return Loader1();
        } else if (state is AllUserLogDropdownState) {
          print(state.usersList.length);
          return Scaffold(
              drawer: NavigationList(),
              appBar: AppBar(
                iconTheme: IconThemeData(color: AppColors.Black),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  "User Logs",
                  style: TextStyle(color: AppColors.Black, fontSize: 23),
                  textAlign: TextAlign.left,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      InkWell(
                        onTap: () {
                          // _selectDate(context);

                          _datepicker(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 6),
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(_range, textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        height: 35,
                        // width: 100,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: false,
                            focusColor: Colors.white,
                            value: _chosenValue,
                            style: TextStyle(color: Colors.white),
                            iconEnabledColor: Colors.black,
                            items: state.usersList.map((value) {
                                  return DropdownMenuItem(
                                    value: value.id.toString(),
                                    child: Text(
                                      value.name.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList() ??
                                [],
                            hint: Text(
                              "User ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                _chosenValue = value;
                                print(_chosenValue);
                              });
                            },
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 25),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        children: [
                          logScreen("Monday", "0:42"),
                          logScreen("Tuesday", "0:42"),
                          logScreen("Wednesday", "0:42"),
                          logScreen("Thrushday", "0:42"),
                          logScreen("Friday", "0:42"),
                          logScreen("Saturday", "0:42"),
                          logScreen("Sunday", "0:42"),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        }
      },
    );
  }

  Widget logScreen(String day, String duration) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.only(top: 10),
        child: Scrollbar(
          controller: _controllerOne,
          thickness: 4,
          // isAlwaysShown: true,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    day,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    duration,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ]),
              Expanded(
                child: Container(
                    height: 600,
                    padding: EdgeInsets.only(top: 25),
                    child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFf6a609),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 2,
                                    height: 70,
                                    color: Color(0xFFFf6a609),
                                  ),
                                ],
                              ),
                              Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text("11:22:11",
                                          textAlign: TextAlign.left),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 70,
                                      child: Text(
                                        "tefst  Login Succesfully by test",
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ])
                            ],
                          );
                        })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
