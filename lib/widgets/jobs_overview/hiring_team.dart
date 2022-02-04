// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/jobs_overview_bloc/jobs_overview_bloc.dart';
import 'package:flutter_product_recruit/model/jobs_overview/hiring_team_model.dart';
import 'package:flutter_product_recruit/services/jobs_overview/jobs_auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../UiConstant/app_colors.dart';

class HiringTeam extends StatelessWidget {
  JobAuthService jobAuthService = new JobAuthService();
  List<HiringTeamModel> hirinTeam;
  List<HiringTeamModel> _adminpanelsize = new List();
  List<HiringTeamModel> _hrpanelsize = new List();
  List<HiringTeamModel> _intervieweepanelsize = new List();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsOverviewBlocBloc, JobsOverviewState>(
      // ignore: missing_return
      builder: (context, state) {
        if (state is JobsOvervViewPageState) {
          hirinTeam = state.hirinTeam;

          for (int i = 0; i < hirinTeam.length; i++) {
            if (hirinTeam[i].userType.contains("Admin")) {
              _adminpanelsize.add(hirinTeam[i]);
            } else if (hirinTeam[i].userType.contains("HR")) {
              _hrpanelsize.add(hirinTeam[i]);
            } else if (hirinTeam[i].userType.contains("Interviewee")) {
              _intervieweepanelsize.add(hirinTeam[i]);
            }
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hiring is a team effort, click on\nany member to filter.",
                  style: TextStyle(
                    color: AppColors.Black,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Admin(s)",
                  style: TextStyle(color: AppColors.Black, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _adminpanelsize.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: _adminpanelsize[index]
                                    .imageUrl
                                    .contains(".jpg") ||
                                _adminpanelsize[index].imageUrl.contains(".png")
                            ? Tooltip(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      _adminpanelsize[index].imageUrl,
                                      scale: 1.0),
                                ),
                                message: _adminpanelsize[index].name,
                              )
                            : Tooltip(
                                child: SvgPicture.network(
                                    hirinTeam[index].imageUrl),
                                message: hirinTeam[index].name,
                              ),
                      );
                    }),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "HR(s)",
                  style: TextStyle(color: AppColors.Black, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _hrpanelsize.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: _hrpanelsize[index].imageUrl.contains(".jpg")
                            ? Tooltip(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      (_hrpanelsize[index].imageUrl)),
                                ),
                                message: _hrpanelsize[index].name,
                              )
                            : Tooltip(
                                child: SvgPicture.network(
                                    _hrpanelsize[index].imageUrl),
                                message: _hrpanelsize[index].name,
                              ),
                      );
                    }),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Interviewee(s)",
                  style: TextStyle(color: AppColors.Black, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _intervieweepanelsize.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: _intervieweepanelsize[index]
                                .imageUrl
                                .contains(".jpg")
                            ? Tooltip(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      (_intervieweepanelsize[index].imageUrl)),
                                ),
                                message: _intervieweepanelsize[index].name,
                              )
                            : Tooltip(
                                child: SvgPicture.network(
                                    _intervieweepanelsize[index].imageUrl),
                                message: _intervieweepanelsize[index].name,
                              ),
                      );
                    })
              ],
            ),
          );
        }
      },
    );
  }
}
