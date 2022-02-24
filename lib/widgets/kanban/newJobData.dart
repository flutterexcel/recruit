// ignore_for_file: must_be_immutable, missing_return

import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/kanban_bloc/kanban_bloc.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/widgets/kanban/bottom_icons.dart';
import 'package:intl/intl.dart';

class NewJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;
  NewJobData({this.resumeData, this.mapCandidateData});
  CandidateCvInfoModel _candidateCvInfoModel;
  bool isMarked;
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
    print("Enter in NewJob");
    try {
      return ListView.builder(
          padding: EdgeInsets.all(8),
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: resumeData.length,
          itemBuilder: (context, index) {
            print("mapCandidateData<>-->$mapCandidateData");
            print("resumedata<>-->${resumeData[index].id}");

            print("resumedata<>-->${mapCandidateData[resumeData[index].id]}");
            _candidateCvInfoModel = mapCandidateData[resumeData[index].id];
            print("_candidateCvInfoModel---->$_candidateCvInfoModel");

            print(
                " resumeData[index].candidateStar.length-->${resumeData[index].runtimeType}");
            isMarked =
                resumeData[index].candidateStar.length != 0 ? false : true;
            if (_candidateCvInfoModel != null)
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
                                                  .images[0],
                                            )),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 240,
                                child: blackText(
                                  resumeData[index].subject,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
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
                              // if (_candidateCvInfoModel != null)
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
                                          : _candidateCvInfoModel.cvParsedInfo
                                                      .finalEntity.phone.obj ==
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

                              // _candidateCvInfoModel.cvParsedInfo == null
                              //     ? SizedBox(
                              //         height: 0,
                              //         width: 0,
                              //       )
                              //     : _candidateCvInfoModel
                              //                 .cvParsedInfo.finalEntity ==
                              //             null
                              //         ? SizedBox(
                              //             height: 0,
                              //             width: 0,
                              //           )
                              //         : _candidateCvInfoModel.cvParsedInfo
                              //                     .finalEntity.email ==
                              //                 null
                              //             ? SizedBox(
                              //                 height: 0,
                              //                 width: 0,
                              //               )
                              //             : _candidateCvInfoModel.cvParsedInfo
                              //                         .finalEntity.email.obj ==
                              //                     null
                              //                 ? SizedBox(
                              //                     height: 0,
                              //                     width: 0,
                              //                   )
                              //                 : greyText(
                              //                     _candidateCvInfoModel
                              //                         .cvParsedInfo
                              //                         .finalEntity
                              //                         .email
                              //                         .obj,
                              //                   ),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    resumeData[index].cvRejected == null
                        ? SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  width: 4,
                                  height: 45,
                                  color: AppColors.purple,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  blackText(
                                    "This Candidate Once Existed in Reject Pipeline",
                                  ),
                                  resumeData[index].rejectReasonData == null
                                      ? SizedBox()
                                      : resumeData[index].rejectReasonData ==
                                              null
                                          ? SizedBox()
                                          : blackText(
                                              "Reason - ${resumeData[index].rejectReasonData.first.rejectReason}",
                                            )
                                ],
                              ),
                            ],
                          ),

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
                    const SizedBox(
                      height: 10,
                    ),
                    _candidateCvInfoModel.cvParsedInfo == null
                        ? SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : _candidateCvInfoModel.cvParsedInfo.finalEntity == null
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
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      greyText('Email'),
                                      blackText(_candidateCvInfoModel
                                          .cvParsedInfo.finalEntity.email.obj),
                                    ],
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
                            : _candidateCvInfoModel.cvParsedInfo.qaShortAnswers
                                        .projectsName ==
                                    null
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
                                      greyText('Project Name'),
                                      blackText(
                                        _candidateCvInfoModel.cvParsedInfo
                                            .qaShortAnswers.projectsName,
                                      )
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
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          greyText('Core Skills'),
                                          blackText(
                                            _candidateCvInfoModel.cvParsedInfo
                                                .answerMap["skills"].answer,
                                          )
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
                                              .answerMap["education_degree"] ==
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
                                                      greyText('Passout Year'),
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
                                      : _candidateCvInfoModel.cvParsedInfo
                                                  .answerMap["personal_dob"] ==
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
                                                      greyText('Date Of Birth'),
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
                                                      .answerMap["exp_company"]
                                                      .answer ==
                                                  null ||
                                              _candidateCvInfoModel
                                                      .cvParsedInfo
                                                      .answerMap["exp_company"]
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
                                                greyText('Recent Organization'),
                                                blackText(_candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .answerMap["exp_company"]
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
                                    : Column(
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

                    _candidateCvInfoModel.cvParsedInfo == null
                        ? SizedBox()
                        : _candidateCvInfoModel.cvParsedInfo.answerMap == null
                            ? SizedBox()
                            : _candidateCvInfoModel
                                        .cvParsedInfo.answerMap["training"] ==
                                    null
                                ? SizedBox()
                                : _candidateCvInfoModel.cvParsedInfo
                                                .answerMap["training"].answer ==
                                            null ||
                                        _candidateCvInfoModel.cvParsedInfo
                                                .answerMap["training"].answer ==
                                            ''
                                    ? SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          greyText('Training'),
                                          blackText(
                                            _candidateCvInfoModel.cvParsedInfo
                                                .answerMap["training"].answer,
                                          )
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
                                    : Column(
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

                    _candidateCvInfoModel.cvParsedInfo == null
                        ? SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : _candidateCvInfoModel.cvParsedInfo.finalEntity == null
                            ? SizedBox(
                                height: 0,
                                width: 0,
                              )
                            : Row(
                                children: [
                                  _candidateCvInfoModel
                                              .cvParsedInfo.finalEntity.phone ==
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
                                              _candidateCvInfoModel.cvParsedInfo
                                                      .finalEntity.gpe.obj ==
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
                        : _candidateCvInfoModel.cvParsedInfo.finalEntity == null
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
                                                .answerMap["personal_location"]
                                                .answer ==
                                            null ||
                                        _candidateCvInfoModel
                                                .cvParsedInfo
                                                .answerMap["personal_location"]
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
                    resumeData[index].cvimage == null
                        ? Text(
                            'Resume Missing. Ask Candidate?\n',
                            style: TextStyle(
                                color: AppColors.Red,
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

                    BottomIcons(
                      data: resumeData[index],
                    ),
                  ],
                ),
              );
          });
    } catch (e) {
      print(e.toString());
      return Center(child: Text(e.toString()));
    }
  }
}
