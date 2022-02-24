import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/widgets/kanban/expanded.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../UiConstant/app_colors.dart';

// ignore: must_be_immutable
class HiredJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;
  HiredJobData({this.resumeData, this.mapCandidateData});
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
    print("Enter in HiredJob");
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
                                StepProgressIndicator(
                                  size: 5,
                                  totalSteps: 3,
                                  padding: 0,
                                  roundedEdges: Radius.circular(3),
                                  customColor: (step) {
                                    int _step = resumeData[index]
                                            .candidateSubTagsMovement
                                            .interview
                                            .last
                                            .tagName
                                            .contains("Offer Sent")
                                        ? 0
                                        : resumeData[index]
                                                .candidateSubTagsMovement
                                                .interview
                                                .last
                                                .tagName
                                                .contains("Accepted")
                                            ? 1
                                            : 2;
                                    if (step == _step) {
                                      return AppColors.Green;
                                    } else
                                      return AppColors.Light_Green;
                                  },
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Offer Sent',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          color: resumeData[index]
                                                  .candidateSubTagsMovement
                                                  .interview
                                                  .last
                                                  .tagName
                                                  .contains("Offer Sent")
                                              ? AppColors.Green
                                              : AppColors.Light_Grey,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      'Accepted',
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          color: resumeData[index]
                                                  .candidateSubTagsMovement
                                                  .interview
                                                  .last
                                                  .tagName
                                                  .contains("Accepted")
                                              ? AppColors.Green
                                              : AppColors.Grey,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      'Joined',
                                      style: TextStyle(
                                          fontFamily: 'RobotRegular',
                                          color: resumeData[index]
                                                  .candidateSubTagsMovement
                                                  .interview[0]
                                                  .tagName
                                                  .contains("Joined")
                                              ? AppColors.Green
                                              : AppColors.Grey,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpandableCustom(expanded: [
                      // resumeData[index].cvRejected == null
                      //     ? SizedBox(
                      //         height: 0,
                      //         width: 0,
                      //       )
                      //     : Row(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(top: 8.0),
                      //             child: Container(
                      //               width: 4,
                      //               height: 45,
                      //               color: AppColors.purple,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 10,
                      //           ),
                      //           Column(
                      //             crossAxisAlignment:
                      //                 CrossAxisAlignment.start,
                      //             children: [
                      //               SizedBox(
                      //                 height: 10,
                      //               ),
                      //               blackText(
                      //                 "This Candidate Once Existed in Reject Pipeline",
                      //               ),
                      //               resumeData[index].rejectReasonData ==
                      //                       null
                      //                   ? SizedBox()
                      //                   : resumeData[index]
                      //                               .rejectReasonData ==
                      //                           null
                      //                       ? SizedBox()
                      //                       : blackText(
                      //                           "Reason - ${resumeData[index].rejectReasonData.first.rejectReason}",
                      //                         )
                      //             ],
                      //           ),
                      //         ],
                      //       ),

                      // _candidateCvInfoModel.cvParsedInfo == null
                      //     ? SizedBox(
                      //         height: 0,
                      //         width: 0,
                      //       )
                      //     : _candidateCvInfoModel.cvParsedInfo.qaShortAnswers ==
                      //             null
                      //         ? SizedBox(
                      //             height: 0,
                      //             width: 0,
                      //           )
                      //         : _candidateCvInfoModel.cvParsedInfo.qaShortAnswers
                      //                     .personalName ==
                      //                 null
                      //             ? SizedBox(
                      //                 height: 0,
                      //                 width: 0,
                      //               )
                      //             : Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: [
                      //                   SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                   greyText('Name'),
                      //                   blackText(
                      //                     resumeData[index].from,
                      //                   )
                      //                 ],
                      //               ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.finalEntity ==
                                  null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel
                                          .cvParsedInfo.finalEntity.email ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          greyText('Email'),
                                          blackText(_candidateCvInfoModel
                                              .cvParsedInfo
                                              .finalEntity
                                              .email
                                              .obj),
                                        ],
                                      ),
                                    ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.qaShortAnswers ==
                                  null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel.cvParsedInfo
                                          .qaShortAnswers.projectsName ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          greyText('Project Name'),
                                          blackText(
                                            _candidateCvInfoModel.cvParsedInfo
                                                .qaShortAnswers.projectsName,
                                          )
                                        ],
                                      ),
                                    ),
                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel
                                          .cvParsedInfo.answerMap["skills"] ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : _candidateCvInfoModel.cvParsedInfo
                                                  .answerMap["skills"].answer ==
                                              null ||
                                          _candidateCvInfoModel.cvParsedInfo
                                                  .answerMap["skills"].answer ==
                                              ''
                                      ? SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              greyText('Core Skills'),
                                              blackText(
                                                _candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .answerMap["skills"]
                                                    .answer,
                                              )
                                            ],
                                          ),
                                        ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Row(
                                  children: [
                                    _candidateCvInfoModel
                                                    .cvParsedInfo.answerMap[
                                                "education_degree"] ==
                                            null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .answerMap[
                                                            "education_degree"]
                                                        .answer ==
                                                    null ||
                                                _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .answerMap[
                                                            "education_degree"]
                                                        .answer ==
                                                    ''
                                            ? SizedBox(
                                                height: 0,
                                                width: 0,
                                              )
                                            : Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    greyText('Qualifications'),
                                                    blackText(_candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .answerMap[
                                                            "education_degree"]
                                                        .answer)
                                                  ],
                                                ),
                                              ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    _candidateCvInfoModel
                                                .cvParsedInfo.answerMap ==
                                            null
                                        ? SizedBox()
                                        : _candidateCvInfoModel
                                                        .cvParsedInfo.answerMap[
                                                    "education_year"] ==
                                                null
                                            ? SizedBox()
                                            : _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .answerMap[
                                                                "education_year"]
                                                            .answer ==
                                                        null ||
                                                    _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .answerMap[
                                                                "education_year"]
                                                            .answer ==
                                                        ''
                                                ? SizedBox()
                                                : Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        greyText(
                                                            'Passout Year'),
                                                        Container(
                                                          //width: 90,
                                                          child: blackText(
                                                              _candidateCvInfoModel
                                                                  .cvParsedInfo
                                                                  .answerMap[
                                                                      "education_year"]
                                                                  .answer),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    _candidateCvInfoModel
                                                .cvParsedInfo.answerMap ==
                                            null
                                        ? SizedBox()
                                        : _candidateCvInfoModel
                                                        .cvParsedInfo.answerMap[
                                                    "personal_dob"] ==
                                                null
                                            ? SizedBox()
                                            : _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .answerMap[
                                                                "personal_dob"]
                                                            .answer ==
                                                        null ||
                                                    _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .answerMap[
                                                                "personal_dob"]
                                                            .answer ==
                                                        ''
                                                ? SizedBox()
                                                : Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        greyText(
                                                            'Date Of Birth'),
                                                        Container(
                                                          //width: 90,
                                                          child: blackText(
                                                              _candidateCvInfoModel
                                                                  .cvParsedInfo
                                                                  .answerMap[
                                                                      "personal_dob"]
                                                                  .answer),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                  ],
                                ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Row(
                                  children: [
                                    _candidateCvInfoModel.cvParsedInfo
                                                .answerMap["exp_company"] ==
                                            null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .answerMap[
                                                            "exp_company"]
                                                        .answer ==
                                                    null ||
                                                _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .answerMap[
                                                            "exp_company"]
                                                        .answer ==
                                                    ''
                                            ? SizedBox(
                                                height: 0,
                                                width: 0,
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  greyText(
                                                      'Recent Organization'),
                                                  blackText(
                                                      _candidateCvInfoModel
                                                          .cvParsedInfo
                                                          .answerMap[
                                                              "exp_company"]
                                                          .answer)
                                                ],
                                              ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    _candidateCvInfoModel
                                                .cvParsedInfo.answerMap ==
                                            null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : _candidateCvInfoModel
                                                        .cvParsedInfo.answerMap[
                                                    "exp_designation"] ==
                                                null
                                            ? SizedBox()
                                            : _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .answerMap[
                                                                "exp_designation"]
                                                            .answer ==
                                                        null ||
                                                    _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .answerMap[
                                                                "exp_designation"]
                                                            .answer ==
                                                        ''
                                                ? SizedBox()
                                                : Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        greyText('Designation'),
                                                        Container(
                                                          //width: 90,
                                                          child: blackText(
                                                              _candidateCvInfoModel
                                                                  .cvParsedInfo
                                                                  .answerMap[
                                                                      "exp_designation"]
                                                                  .answer),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                  ],
                                ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel.cvParsedInfo
                                          .answerMap["exp_duration"] ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap["exp_duration"]
                                                  .answer ==
                                              null ||
                                          _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap["exp_duration"]
                                                  .answer ==
                                              ''
                                      ? SizedBox()
                                      : Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              greyText('Recent Duration'),
                                              blackText(
                                                _candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .answerMap["exp_duration"]
                                                    .answer,
                                              )
                                            ],
                                          ),
                                        ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox()
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox()
                              : _candidateCvInfoModel
                                          .cvParsedInfo.answerMap["training"] ==
                                      null
                                  ? SizedBox()
                                  : _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap["training"]
                                                  .answer ==
                                              null ||
                                          _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap["training"]
                                                  .answer ==
                                              ''
                                      ? SizedBox()
                                      : Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              greyText('Training'),
                                              blackText(
                                                _candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .answerMap["training"]
                                                    .answer,
                                              )
                                            ],
                                          ),
                                        ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel.cvParsedInfo
                                          .answerMap["certifications"] ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap["certifications"]
                                                  .answer ==
                                              null ||
                                          _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap["certifications"]
                                                  .answer ==
                                              ''
                                      ? SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              greyText('Certifications'),
                                              blackText(
                                                _candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .answerMap["certifications"]
                                                    .answer,
                                              )
                                            ],
                                          ),
                                        ),

                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.finalEntity ==
                                  null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Row(
                                  children: [
                                    _candidateCvInfoModel.cvParsedInfo
                                                .finalEntity.phone ==
                                            null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                greyText('Phone'),
                                                blackText(_candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .finalEntity
                                                    .phone
                                                    .obj)
                                              ],
                                            ),
                                          ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    _candidateCvInfoModel
                                                .cvParsedInfo.finalEntity.gpe ==
                                            null
                                        ? SizedBox(
                                            height: 0,
                                            width: 0,
                                          )
                                        : _candidateCvInfoModel.cvParsedInfo
                                                        .finalEntity.gpe.obj ==
                                                    null ||
                                                _candidateCvInfoModel
                                                        .cvParsedInfo
                                                        .finalEntity
                                                        .gpe
                                                        .obj ==
                                                    ''
                                            ? SizedBox()
                                            : Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    greyText('Location'),
                                                    Container(
                                                      //width: 90,
                                                      child: blackText(
                                                          _candidateCvInfoModel
                                                              .cvParsedInfo
                                                              .finalEntity
                                                              .gpe
                                                              .obj),
                                                    )
                                                  ],
                                                ),
                                              ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    _candidateCvInfoModel
                                                .cvParsedInfo.finalEntity.dob ==
                                            null
                                        ? SizedBox()
                                        : Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                greyText('DOB'),
                                                Container(
                                                  width: 100,
                                                  child: blackText(
                                                      _candidateCvInfoModel
                                                          .cvParsedInfo
                                                          .finalEntity
                                                          .dob
                                                          .obj),
                                                )
                                              ],
                                            ),
                                          ),
                                    SizedBox(
                                      width: 0,
                                    )
                                  ],
                                ),
                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.finalEntity ==
                                  null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel
                                          .cvParsedInfo.finalEntity.gender ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            greyText('Gender'),
                                            blackText(_candidateCvInfoModel
                                                .cvParsedInfo
                                                .finalEntity
                                                .gender[0])
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        // Column(
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     SizedBox(
                                        //       height: 10,
                                        //     ),
                                        //     greyText('Core Skills'),
                                        //     blackText(_candidateCvInfoModel
                                        //         .cvParsedInfo
                                        //         .finalEntity
                                        //         .gender[0])
                                        //   ],
                                        // ),
                                      ],
                                    ),
                      SizedBox(
                        width: 20,
                      ),
                      _candidateCvInfoModel.cvParsedInfo == null
                          ? SizedBox(
                              height: 0,
                              width: 0,
                            )
                          : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : _candidateCvInfoModel.cvParsedInfo
                                          .answerMap["personal_location"] ==
                                      null
                                  ? SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                                  : _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap[
                                                      "personal_location"]
                                                  .answer ==
                                              null ||
                                          _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .answerMap[
                                                      "personal_location"]
                                                  .answer ==
                                              ''
                                      ? SizedBox(
                                          height: 0,
                                          width: 0,
                                        )
                                      : Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                greyText('Location'),
                                                blackText(_candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .answerMap[
                                                        "personal_location"]
                                                    .answer)
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),

                                            // Column(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   children: [
                                            //     SizedBox(
                                            //       height: 10,
                                            //     ),
                                            //     greyText('Core Skills'),
                                            //     blackText(_candidateCvInfoModel
                                            //         .cvParsedInfo
                                            //         .finalEntity
                                            //         .gender[0])
                                            //   ],
                                            // ),
                                          ],
                                        ),

                      const SizedBox(
                        height: 10,
                      ),
                    ]),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Divider(
                        height: 10,
                        color: AppColors.Black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_down_alt_outlined,
                                    color: AppColors.grey,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.grade_outlined,
                                    color: AppColors.grey,
                                    size: 25,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.drafts_outlined,
                                    color: AppColors.grey,
                                    size: 25,
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
                                  Icon(
                                    Icons.description_outlined,
                                    color: AppColors.grey,
                                    size: 25,
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
                                  child: InkWell(
                                      child: Text('Move To Custom Tag')),
                                ),
                                PopupMenuItem<String>(
                                  child: InkWell(child: Text('Update Email')),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
