import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../UiConstant/app_colors.dart';

class InterviewJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;
  InterviewJobData({this.resumeData, this.mapCandidateData});
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
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                     color: resumeData[index].unread
                        ? AppColors.Grey
                        : resumeData[index].candidateStar.length != 0
                            ? AppColors.Orange
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
                              : GestureDetector(
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
                                      child: Image.network(resumeData[index]
                                                  .cvimage
                                                  .picture ==
                                              null
                                          ? resumeData[index]
                                              .cvimage
                                              .images
                                              .first
                                          : resumeData[index].cvimage.picture)),
                                  onTap: () {
                                    _popupDialog(context,
                                        resumeData[index].cvimage.images[0]);
                                  },
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
                                StepProgressIndicator(
                                  size: 5,
                                  totalSteps: 3,
                                  padding: 0,
                                  currentStep: resumeData[index]
                                          .interview
                                          .first
                                          .details
                                          .last
                                          .roundName
                                          .contains("Fist Round")
                                      ? 1
                                      : resumeData[index]
                                                  .interview
                                                  .first
                                                  .details
                                                  .last
                                                  .roundName ==
                                              "Second Round"
                                          ? 2
                                          : 3,
                                  roundedEdges: Radius.circular(3),
                                  customColor: (step) {
                                    int _step = resumeData[index]
                                            .interview
                                            .first
                                            .details
                                            .last
                                            .roundName
                                            .contains("First Round")
                                        ? 0
                                        : resumeData[index]
                                                .interview
                                                .first
                                                .details
                                                .last
                                                .roundName
                                                .contains("Second Round")
                                            ? 1
                                            : 2;
                                    if (step ==
                                        _step) {
                                      return AppColors.Voilet;
                                    } else
                                      return AppColors.LIght_Voilet;
                                  },
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'First Round',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          color: resumeData[index]
                                                      .interview
                                                      .first
                                                      .details
                                                      .last
                                                      .roundName ==
                                                  "First Round"
                                              ? AppColors.Voilet
                                              : AppColors.Light_Grey,
                                          fontSize: 10),
                                    ),
                                    Text(
                                      'Second Round',
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          color: resumeData[index]
                                                      .interview
                                                      .first
                                                      .details
                                                      .last
                                                      .roundName ==
                                                  "Second Round"
                                              ? AppColors.Voilet
                                              : AppColors.Grey,
                                          fontSize: 10),
                                    ),
                                    Text(
                                      'Third Round',
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          color: resumeData[index]
                                                      .interview
                                                      .first
                                                      .details
                                                      .last
                                                      .roundName ==
                                                  "Third Round"
                                              ? AppColors.Voilet
                                              : AppColors.Grey,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      resumeData[index]
                                          .interview
                                          .last
                                          .details
                                          .last
                                          .roundName,
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child:
                                          Image.asset("assets/icons/int.png"),
                                    ),
                                    Expanded(
                                        child: Text(
                                            DateFormat.d().format(
                                                    resumeData[index]
                                                        .interview
                                                        .last
                                                        .details
                                                        .last
                                                        .scheduleDate) +
                                                ' ' +
                                                DateFormat.MMMM().format(
                                                    resumeData[index]
                                                        .interview
                                                        .last
                                                        .details
                                                        .last
                                                        .scheduleDate) +
                                                ' @ ' +
                                                resumeData[index]
                                                    .interview
                                                    .last
                                                    .details
                                                    .last
                                                    .scheduleTime,
                                            style: TextStyle(
                                                fontFamily: 'RobotRegular',
                                                color: AppColors.Blue,
                                                fontSize: 12)))
                                   
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    resumeData[index].cvimage == null
                        ? Text(
                            'Mail sent on ${resumeData[index].senderMail} for missing resume',
                            style: TextStyle(
                                color: AppColors.Orange,
                                fontFamily: 'RobotRegular'),
                          )
                        : SizedBox(
                            height: 0,
                            width: 0,
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
