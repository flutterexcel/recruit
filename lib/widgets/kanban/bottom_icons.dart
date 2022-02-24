// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/kanban_bloc/kanban_bloc.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/model/rejectreason_model.dart';
import 'package:flutter_product_recruit/widgets/kanban/notes_dialouge.dart';
import 'package:flutter_product_recruit/widgets/kanban/reject_dialouge.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/components/badge/gf_icon_badge.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/shape/gf_icon_button_shape.dart';
import 'package:intl/intl.dart';

class BottomIcons extends StatefulWidget {
  Datum data;
  BottomIcons({this.data});

  @override
  State<BottomIcons> createState() => _BottomIconsState();
}

class _BottomIconsState extends State<BottomIcons> {
  Widget greyText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'RobotRegular', color: AppColors.Grey, fontSize: 13),
    );
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('MMM dd').format(widget.data.date);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.thumb_down_alt_outlined,
                      color: AppColors.grey,
                      size: 25,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return BlocBuilder<KanbanBloc, KanbanState>(
                                builder: (context, state) {
                              if (state is KanbanInitialState) {
                                context
                                    .bloc<KanbanBloc>()
                                    .add(KanbanRejectEvent());
                                return Loader1();
                              } else if (state is KanbanRejectReasonState) {
                                // var reasons;
                                // for (var i in state.rejectReasons.reason) {
                                //   reasons = i.reason;
                                // }
                                return Dialog(
                                    child: RejectDialog(
                                  data: state.rejectReasons.reason,
                                  name: widget.data.from,
                                ));
                              }
                            });
                          });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.data.candidateStar.length > 0
                      ? InkWell(
                          child: Icon(
                            Icons.grade_outlined,
                            color: AppColors.orange12,
                            size: 25,
                          ),
                          onTap: () {
                            context.bloc<KanbanBloc>().add(KanbanStarEvent(
                                mongoid: widget.data.id, value: false));
                          },
                        )
                      : InkWell(
                          child: Icon(
                            Icons.grade_outlined,
                            color: AppColors.grey,
                            size: 25,
                          ),
                          onTap: () {
                            context.bloc<KanbanBloc>().add(KanbanStarEvent(
                                mongoid: widget.data.id, value: true));
                          },
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.data.unread
                      ? InkWell(
                          child: Icon(
                            Icons.drafts_outlined,
                            color: AppColors.Black,
                            size: 25,
                          ),
                          onTap: () {
                            context.bloc<KanbanBloc>().add(KanbanUnreadEvent(
                                  mongoid: widget.data.id,
                                ));
                          },
                        )
                      : InkWell(
                          child: Icon(
                            Icons.drafts_outlined,
                            color: AppColors.grey,
                            size: 25,
                          ),
                          onTap: () {
                            context.bloc<KanbanBloc>().add(KanbanReadEvent(
                                  mongoid: widget.data.id,
                                ));
                          },
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.message_outlined,
                      color: AppColors.grey,
                      size: 25,
                    ),
                    onTap: () {
                      // _popupManageSourceFetchFromDialog(context);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.data.notes.length == 0
                      ? InkWell(
                          child: Icon(
                            Icons.description_outlined,
                            color: AppColors.grey,
                            size: 25,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      child: NoteDialog(
                                    data: widget.data,
                                  ));
                                });
                          },
                        )
                      : GFIconBadge(
                          child: Icon(
                            Icons.description_outlined,
                            size: 25,
                          ),
                          //shape: GFIconButtonShape.pills,

                          counterChild: Padding(
                            padding: EdgeInsets.only(
                              left: 11,
                            ),
                            child: GFBadge(
                              shape: GFBadgeShape.circle,
                              size: 35,
                              color: AppColors.orange12,
                              child: Text(widget.data.notes.length.toString()),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            greyText(date),
            PopupMenuButton(
              //key: _menuKey,
              itemBuilder: (_) => <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: InkWell(
                    child: Text('Change Job Profile'),
                    onTap: () {},
                  ),
                ),
                PopupMenuItem<String>(
                  child: InkWell(
                    child: Text('Archive'),
                    onTap: () {},
                  ),
                ),
                PopupMenuItem<String>(
                  child: InkWell(
                    child: Text('Update Call Status'),
                    onTap: () {},
                  ),
                ),
                PopupMenuItem<String>(
                  child: InkWell(child: Text('Update Email')),
                ),
                PopupMenuItem<String>(
                  child: InkWell(child: Text('Move To Custom Tag')),
                ),
                PopupMenuItem<String>(
                  child: InkWell(child: Text('Update Email')),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
