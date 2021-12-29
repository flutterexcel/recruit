import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/services/kanban_service/kanban_auth_service.dart';

part 'kanban_event.dart';
part 'kanban_state.dart';

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  KanbanAuthService kanbanAuthService = new KanbanAuthService();
  KanbanBloc() : super(KanbanInitialState());
  List jobTagKeys = [];

  @override
  Stream<KanbanState> mapEventToState(
    KanbanEvent event,
  ) async* {
    if (event is KanbanInitialEvent) {
      yield* _mapKanbanInitialToState(event);
    }
  }

  Stream<KanbanState> _mapKanbanInitialToState(
      KanbanInitialEvent event) async* {
    try {
      Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
      Map<String, JobTagData> mapJobTagData =
          await kanbanAuthService.getJobTagData(event.jobToken);
      print('>>>>>>>>> ${mapJobTagData.entries}');
      for (String key in mapJobTagData.keys) {
        await kanbanAuthService
            .getCandididateCvInfo(key, event.jobToken)
            .then((value) {
          Map<String, CandidateCvInfoModel> map = new Map();
          map = value;

          mapCandidateData.addAll(map);
          map.clear();
        });
      }
      yield KanbanPageState(
          listJobTag: event._listJobTag,
          title: event.title,
          mapCandidateData: mapCandidateData,
          mapJobTagData: mapJobTagData);
    } catch (e) {
      yield KanbanInitialState();
    }
  }
}
