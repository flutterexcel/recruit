import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/widgets/kanban/bottom_icons.dart';
import 'package:flutter_product_recruit/widgets/kanban/reject_bottom_icons.dart';
import 'package:intl/intl.dart';

import '../../UiConstant/app_colors.dart';

// ignore: must_be_immutable
class RejectJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;

  RejectJobData({this.resumeData, this.mapCandidateData});

  CandidateCvInfoModel _candidateCvInfoModel;
  void _popupDialog(BuildContext context, String imageUrl) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Image(image: NetworkImage(imageUrl)));
        });
  }

  Widget greyText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'RobotRegular', color: AppColors.Grey, fontSize: 13),
    );
  }

  Widget blackText(String text) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'RobotRegular', fontSize: 15, color: AppColors.Black),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Enter in RejectJob");
    try {
      return Container(
        color: AppColors.Grey_BackGround,
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: resumeData.length,
            itemBuilder: (context, index) {
              _candidateCvInfoModel = mapCandidateData[resumeData[index].id];
              var date = DateFormat('MMM dd').format(resumeData[index].date);
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: resumeData[index].unread &&
                              resumeData[index].candidateStar.length != 0
                          ? AppColors.orange12
                          : resumeData[index].candidateStar.length != 0
                              ? AppColors.Orange
                              : resumeData[index].unread
                                  ? AppColors.Black
                                  : Colors.grey[350],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          resumeData[index].cvimage == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    GestureDetector(
                                      child: Tooltip(
                                        message: 'Open Resume',
                                        child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey[350],
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(0))),
                                            height: 100,
                                            width: 80,
                                            child: Image.network(
                                                resumeData[index]
                                                            .cvimage
                                                            .picture ==
                                                        null
                                                    ? resumeData[index]
                                                        .cvimage
                                                        .images
                                                        .first
                                                    : resumeData[index]
                                                        .cvimage
                                                        .picture)),
                                      ),
                                      onTap: () {
                                        _popupDialog(
                                            context,
                                            resumeData[index]
                                                .cvimage
                                                .images[0]);
                                      },
                                    ),
                                    _candidateCvInfoModel.cvParsedInfo == null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : _candidateCvInfoModel.cvParsedInfo
                                                    .candidateScore ==
                                                null
                                            ? SizedBox(
                                                height: 0,
                                                width: 0,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    80))),
                                                    child: Text(
                                                      _candidateCvInfoModel
                                                          .cvParsedInfo
                                                          .candidateScore
                                                          .toStringAsFixed(1),
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.white),
                                                    )),
                                              ),
                                  ],
                                ),
                          Container(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                resumeData[index].from != null
                                    ? Container(
                                        width: 240,
                                        child: blackText(
                                          resumeData[index].from,
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                        width: 0,
                                      ),
                                SizedBox(
                                  height: 6,
                                ),
                                _candidateCvInfoModel.cvParsedInfo == null
                                    ? SizedBox(
                                        height: 0,
                                        width: 0,
                                      )
                                    : _candidateCvInfoModel
                                                .cvParsedInfo.finalEntity ==
                                            null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : _candidateCvInfoModel.cvParsedInfo
                                                    .finalEntity.phone ==
                                                null
                                            ? SizedBox(
                                                height: 0,
                                                width: 0,
                                              )
                                            : _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .finalEntity
                                                        .phone
                                                        .obj ==
                                                    null
                                                ? SizedBox(
                                                    height: 0,
                                                    width: 0,
                                                  )
                                                : greyText(
                                                    _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .finalEntity
                                                        .phone
                                                        .obj,
                                                  ),
                                SizedBox(
                                  height: 6,
                                ),
                                resumeData[index].senderMail == null
                                    ? SizedBox(
                                        height: 0,
                                        width: 0,
                                      )
                                    : Container(
                                        width: 230,
                                        child: greyText(
                                          resumeData[index].senderMail,
                                        )),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.Light_Red,
                                      ),
                                      height: 30,
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: blackText(resumeData[index]
                                          .rejectReasonData
                                          .last
                                          .rejectReason),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    resumeData[index].cvimage == null
                        ? Text(
                            'Resume Missing. Ask Candidate?\n',
                            style: TextStyle(
                                color: AppColors.Red,
                                fontFamily: 'RobotRegular'),
                          )
                        : SizedBox(
                            height: 20,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Divider(
                        height: 10,
                        color: AppColors.Black,
                      ),
                    ),
                    RejectBottomIcons(
                      data: resumeData[index],
                    ),
                  ],
                ),
              );
            }),
      );
    } catch (e) {
      return Center(child: Text('NO RESPONSE DATA'));
    }
  }
}
