// ignore_for_file: must_be_immutable, missing_return

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/widgets/kanban/expanded.dart';
import 'package:intl/intl.dart';

import '../../UiConstant/app_colors.dart';

class ShortlistJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;
  ShortlistJobData({this.resumeData, this.mapCandidateData});
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
    print("Enter in ShortList");
    try {
      return Container(
        color: AppColors.Grey_BackGround,
        child: ListView.builder(
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: resumeData.length,
            itemBuilder: (context, index) {
              print("mapCandidateData<>-->$mapCandidateData");
              print("resumedata<>-->${resumeData[index].id}");

              print("resumedata<>-->${mapCandidateData[resumeData[index].id]}");
              _candidateCvInfoModel = mapCandidateData[resumeData[index].id];
              print("gtyjuyki-->$_candidateCvInfoModel");
              var date = DateFormat('MMM dd').format(resumeData[index].date);

              var lastEmaildate = resumeData[index].lastMailDate != null
                  ? DateFormat('dd MMM').format(resumeData[index].lastMailDate)
                  : '';
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                        Row(
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
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey[350],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(0))),
                                              height: 110,
                                              width: 80,
                                              child:
                                                  Image.network(
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
                                                  .images
                                                  .first);
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          80))),
                                                      child: Text(
                                                        _candidateCvInfoModel
                                                            .cvParsedInfo
                                                            .candidateScore
                                                            .toStringAsFixed(1),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .white),
                                                      )),
                                                ),
                                    ],
                                  ),
                            Container(
                              width: 220,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            )
                          ],
                        ),
                        Row(
                          children: [
                            resumeData[index].from != null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      greyText('Name'),
                                      blackText(
                                        resumeData[index].from,
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                    width: 0,
                                  ),
                            SizedBox(
                              width: 20,
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
                                                .finalEntity.email ==
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
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                greyText('Email'),

                                                Text(_candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .finalEntity
                                                    .email
                                                    .obj),
                                                // blackText(_candidateCvInfoModel
                                                //     .cvParsedInfo
                                                //     .finalEntity
                                                //     .email
                                                //     .obj),
                                              ],
                                            ),
                                          ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _candidateCvInfoModel.cvParsedInfo
                                                  .finalEntity.phone ==
                                              null
                                          ? SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                greyText('Phone'),
                                                blackText(_candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .finalEntity
                                                    .phone
                                                    .obj)
                                              ],
                                            ),
                                      _candidateCvInfoModel.cvParsedInfo
                                                  .finalEntity.gpe ==
                                              null
                                          ? SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                greyText('Location'),
                                                Container(
                                                  width: 90,
                                                  child: blackText(
                                                      _candidateCvInfoModel
                                                          .cvParsedInfo
                                                          .finalEntity
                                                          .gpe
                                                          .obj),
                                                )
                                              ],
                                            ),
                                      _candidateCvInfoModel.cvParsedInfo
                                                  .finalEntity.dob ==
                                              null
                                          ? SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                          : Column(
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
                                    ],
                                  ),
                        SizedBox(
                          height: 10,
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
                                                  .finalEntity.gender ==
                                              null
                                          ? SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                greyText('Gender'),
                                                blackText(_candidateCvInfoModel
                                                    .cvParsedInfo
                                                    .finalEntity
                                                    .gender[0])
                                              ],
                                            ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      _candidateCvInfoModel
                                                  .cvParsedInfo
                                                  .finalEntity
                                                  .educationDegree ==
                                              null
                                          ? SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                          // : _candidateCvInfoModel.cvParsedInfo
                                          //             .finalEntity.education.length ==0

                                          //     ? SizedBox(
                                          //         height: 0,
                                          //         width: 0,
                                          //       )
                                          : _candidateCvInfoModel
                                                      .cvParsedInfo
                                                      .finalEntity
                                                      .educationDegree
                                                      .obj ==
                                                  null
                                              ? SizedBox(
                                                  height: 0,
                                                  width: 0,
                                                )
                                              // :
                                              //  _candidateCvInfoModel
                                              //             .cvParsedInfo
                                              //             .finalEntity
                                              //            .educationDegree
                                              //         .obj ==
                                              //         null
                                              //     ? SizedBox(
                                              //         height: 0,
                                              //         width: 0,
                                              //       )
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    greyText('Education'),
                                                    blackText("B.C.A")
                                                    // blackText(_candidateCvInfoModel
                                                    //     .cvParsedInfo
                                                    //     .finalEntity
                                                    //     .educationDegree
                                                    //     .obj)
                                                  ],
                                                ),
                                      //_candidateCvInfoModel.cvParsedInfo.finalEntity.education.last.last.educationDegree,
                                    ],
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
                                lastEmaildate == ""
                                    ? greyText("$date")
                                    : greyText("$lastEmaildate/$date"),
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
                                      child:
                                          InkWell(child: Text('Update Email')),
                                    ),
                                    PopupMenuItem<String>(
                                      child: InkWell(
                                          child: Text('Move To Custom Tag')),
                                    ),
                                    PopupMenuItem<String>(
                                      child:
                                          InkWell(child: Text('Update Email')),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Tooltip(
                    message: 'Done Via Automation',
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      //    padding: EdgeInsets.only(left: 15, top: 10, bottom: 5),
                      height: 7,
                      width: 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.Red),
                      child: Text(""),
                    ),
                  ),
                ],
              );
            }),
      );
    } catch (e) {
      return Center(child: Text('NO RESPONSE DATA'));
    }
  }
}
