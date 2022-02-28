// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/kanban_bloc/kanban_bloc.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/model/rejectreason_model.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';

// ignore: camel_case_types
class RejectDialog extends StatefulWidget {
  List<Reason> data;
  String name;
  RejectDialog({this.data, this.name});

  @override
  State<RejectDialog> createState() => _RejectDialogState();
}

class _RejectDialogState extends State<RejectDialog> {
  TextEditingController noteController = TextEditingController();
  String selectedRejectReason;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Rejecting ${widget.name}',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Keep a record for future',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'RobotRegular',
                    color: AppColors.grey),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Reason for rejection',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'RobotRegular',
                    color: AppColors.grey),
                textDirection: TextDirection.ltr,
              ),
              DropdownButton<String>(
                onChanged: (String value) {
                  setState(() {
                    selectedRejectReason = value;
                  });
                },
                value: selectedRejectReason,

                isExpanded: true,

                // The list of options
                items: widget.data
                        .map((e) => DropdownMenuItem<String>(
                              child: Container(
                                child: Text(
                                  e.reason,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                              value: e.reason,
                            ))
                        .toList() ??
                    [],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text('Send a mail'),
                        activeColor: AppColors.orange12,
                        checkColor: Colors.white,
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value;
                          });
                        }),
                  ),
                  !_isChecked
                      ? Expanded(
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                                height: 40,
                                minWidth: 6,
                                color: AppColors.blue,
                                child: Text(
                                  'Reject',
                                  style: TextStyle(fontSize: 13),
                                ),
                                textColor: Colors.white,
                                onPressed: () {
                                  // context.bloc<KanbanBloc>().add(KanbanNoteEvent(
                                  //             candidateLink:widget.data.c
                                  //             ));
                                }),
                          ),
                        )
                      : Expanded(
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.bottomRight,
                                child: FlatButton(
                                    height: 40,
                                    minWidth: 6,
                                    color: AppColors.blue,
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    textColor: Colors.white,
                                    onPressed: () {
                                      // context.bloc<KanbanBloc>().add(KanbanNoteEvent(
                                      //             candidateLink:widget.data.c
                                      //             ));
                                    }),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  width: 30,
                                  decoration:
                                      BoxDecoration(color: AppColors.blue),
                                  child: PopupMenuButton(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    //key: _menuKey,
                                    itemBuilder: (_) => <PopupMenuItem<String>>[
                                      PopupMenuItem<String>(
                                        child: InkWell(
                                          child: Text('Edit'),
                                          onTap: () {
                                            // context.bloc<KanbanBloc>().add(KanbanUnreadEvent(
                                            //     jobTagId, 25, 1, _listJobTag[left].id, true));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'An Email is sent to the candidate after 24 hrs',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'RobotRegular',
                    color: AppColors.darkGrey),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
