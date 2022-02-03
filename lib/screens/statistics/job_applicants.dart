import 'package:flutter/material.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_state.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class JobApplicants extends StatelessWidget {
  bool isSwitched = false;

  var state;

  JobApplicants(this.state);

  @override
  Widget build(BuildContext context) {
    print(state);
    return Contain(
      width: MediaQuery.of(context).size.width,
      height: 155,
      borderrad: 5,
      outlinecolor: AppColors.grey,
      child: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Textt(
                    text:
                        "${state.applicationStatusList[2].jobApplicants}  Job Applicants",
                    size: 17,
                    fweight: FontWeight.bold,
                  ),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[0].jobApplicantsTagNew}  New",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.orange12,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[1].shortlist} Shortlist",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.Green,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[2].interview}  Interview",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.purple,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[3].hired}  Hired",
                                size: 17,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.Red,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[4].hold} Hold",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[5].reject}  Reject",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.Light_Blue,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[6].firstRound} First",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.purple,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[7].secondRound} Second",
                                size: 17,
                              ),
                            ),
                          )),
                      Text("")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.Light_Blue,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[8].thirdRound} Third",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.purple,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[9].offerSent}  Offer",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.Red,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[10].accepted} Accepted",
                                size: 17,
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 4,
                          height: 25,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Textt(
                                text:
                                    "${state.applicationStatusList[3].jobApplicantsTags[11].joined}  Joined",
                                size: 17,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
