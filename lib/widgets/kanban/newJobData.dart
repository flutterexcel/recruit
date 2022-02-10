// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';

class NewJobData extends StatelessWidget {
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<Datum> resumeData;
  NewJobData({this.resumeData, this.mapCandidateData});
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
    print("mapCandidateData----->$mapCandidateData");
    try {
      return ListView.builder(
          padding: EdgeInsets.all(8),
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
                                    child: Image.network(
                                      resumeData[index].cvimage.images[0],
                                    )),
                                onTap: () {
                                  _popupDialog(context,
                                      resumeData[index].cvimage.images[0]);
                                },
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
                                      .personalName ==
                                  null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    greyText('Name'),
                                    blackText(
                                      resumeData[index].from,
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
                                      .cvParsedInfo.finalEntity.email ==
                                  null
                              ? SizedBox(
                                  height: 0,
                                  width: 0,
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    greyText('Email'),
                                    blackText(_candidateCvInfoModel
                                        .cvParsedInfo.finalEntity.email.obj),
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
                                    : Row(
                                        children: [
                                          Column(
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
                                          SizedBox(
                                            width: 20,
                                          )
                                        ],
                                      ),
                                _candidateCvInfoModel
                                            .cvParsedInfo.finalEntity.gpe ==
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
                                          SizedBox(
                                            width: 20,
                                          )
                                        ],
                                      ),
                                _candidateCvInfoModel
                                            .cvParsedInfo.finalEntity.dob ==
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
                                          SizedBox(
                                            width: 0,
                                          )
                                        ],
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
                                            .cvParsedInfo.finalEntity.gender[0])
                                      ],
                                    ),
                                    // Column(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     SizedBox(
                                    //       height: 10,
                                    //     ),
                                    //     greyText('Gender'),
                                    //     blackText(_candidateCvInfoModel
                                    //         .cvParsedInfo.finalEntity.gender[0])
                                    //   ],
                                    // ),
                                  ],
                                ),
                  resumeData[index].cvimage == null
                      ? Text(
                          'Resume Missing. Ask Candidate?\n',
                          style: TextStyle(
                              color: AppColors.Red, fontFamily: 'RobotRegular'),
                        )
                      : SizedBox(
                          height: 0,
                          width: 0,
                        )
                ],
              ),
            );
          });
    } catch (e) {
      return Center(child: Text(e.toString()));
    }
  }
}
