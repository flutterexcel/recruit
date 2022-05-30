// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/kanban_bloc/kanban_bloc.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/widgets/kanban/kanban_page_widget.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';

class KanbanScreen extends StatelessWidget {
  String jobToken;
  String title;
  List<JobTag> _listJobTag;
  KanbanScreen(this._listJobTag, this.title, this.jobToken);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KanbanBloc(),
      child: BlocBuilder<KanbanBloc, KanbanState>(
        builder: (context, state) {
          print('>>>> main screen $state');
          if (state is KanbanInitialState) {
            context
                .bloc<KanbanBloc>()
                .add(KanbanInitialEvent(_listJobTag, title, jobToken));
          }
          if (state is KanbanPageState) {
            return KanbanPageWidget(state.listJobTag, state.title,
                state.mapCandidateData, state.mapJobTagData);
          }
          return Loader();
        },
      ),
    );
  }
}
