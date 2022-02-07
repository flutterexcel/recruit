// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/jobs_overview_bloc/jobs_overview_bloc.dart';
import 'package:flutter_product_recruit/widgets/jobs_overview/jobsoverviewpage.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';

class JobsOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsOverviewBlocBloc, JobsOverviewState>(
      builder: (context, state) {
        if (state is JobsOverviewBlocInitial) {
          context.bloc<JobsOverviewBlocBloc>().add(JobsOverviewInitial());
          return Loader1();
        } else if (state is JobsOvervViewPageState) {
          print("hiiiiiiiii");
          return JobsOverviewPage(
            getData: state.getData,
            jobsOverViewModel: state.jobsOverViewModel,
            listJobTag: state.listJobTag,
          );
        }
        return Loader();
      },
    );
  }
}
