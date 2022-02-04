// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_bloc.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_event.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_state.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';

class JobApplicationDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobListBloc, JobListState>(builder: (context, state) {
      if (state is JobListInitialState) {
        context.bloc<JobListBloc>().add(JobListInitialEvent());
        return SizedBox(height: 35, child: Loader());
      } else if (state is GetJobListState) {
        //  print("statessss----$state");
        print(state.jobLists.length);
        return Container(
            child: Wrap(
          //   runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 8.0, // gap between adjacent chips
          //  runSpacing: 4.0, // gap between lines
          children: [
            for (var i = 0; i < state.jobLists.length; i++)
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        height: 10,
                        width: 10,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]),
                        child: Text(""),
                      ),
                    ),
                    TextSpan(text: "  ${state.jobLists[i].title}"),
                  ],
                ),
                // textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              )
          ],
        ));
      } else
        return Container();
    });
  }
}
