// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/kanban_bloc/kanban_bloc.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/model/manage_spam_model.dart';
import 'package:flutter_product_recruit/widgets/TextInput.dart';

// ignore: camel_case_types
class NoteDialog extends StatefulWidget {
  Datum data;
  NoteDialog({this.data});

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 230,
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
                'Add Note',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'RobotRegular',
                ),
                textDirection: TextDirection.ltr,
              ),
              Text(
                'Keep a record for future',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'RobotRegular',
                    color: AppColors.grey),
                textDirection: TextDirection.ltr,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: noteController,
                //expands: true,
                // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                height: 40,
                minWidth: 6,
                color: AppColors.Orange,
                child: Text(
                  'Save',
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
            height: 5,
          ),
        ],
      ),
    );
  }
}
