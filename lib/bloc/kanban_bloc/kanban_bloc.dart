import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/jobs_overview/jobtag.dart';
import 'package:flutter_product_recruit/model/kanban/candiateCvInfo.dart';
import 'package:flutter_product_recruit/model/kanban/jobdatamodel.dart';
import 'package:flutter_product_recruit/model/rejectreason_model.dart';
import 'package:flutter_product_recruit/services/kanban_service/candidateCvInfoService.dart';
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
    } else if (event is KanbanStarEvent) {
      yield* _mapKanbanStarToState(event);
    } else if (event is KanbanUnreadEvent) {
      yield* _mapKanbanUnreadToState(event);
    } else if (event is KanbanReadEvent) {
      yield* _mapKanbanReadToState(event);
    } else if (event is KanbanRejectEvent) {
      yield* _mapKanbanRejectToState(event);
    }
    //  else if (event is KanbanUnreadEvent) {
    //   print("event.listJobTagId----->${event.listJobTagId}");
    //   yield* _mapKanbanUnreadToState(event);
    // }
  }

  Stream<KanbanState> _mapKanbanInitialToState(
      KanbanInitialEvent event) async* {
    try {
      print("Enter in try block");
      Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
      Map<String, JobTagData> mapJobTagData =
          await kanbanAuthService.getJobTagData(event.jobToken);
      print('mapJobTagData.entries--> ${mapJobTagData.entries}');

      for (String key in mapJobTagData.keys) {
        print("mapJobTagData.keys---->${mapJobTagData.keys}");
        print("event.jobToken-->${event.jobToken}");
        await kanbanAuthService
            .getCandididateCvInfo(key, event.jobToken)
            .then((value) {
          print("map-->$value");
          Map<String, CandidateCvInfoModel> map = new Map();
          map = value;
          print("map---->$map");
          mapCandidateData.addAll(map);
          print("------>mapCandidateData-->$mapCandidateData");

          map.clear();
        });
      }
      print('bh1');
      yield KanbanPageState(
          jobToken: event.jobToken,
          listJobTag: event._listJobTag,
          title: event.title,
          mapCandidateData: mapCandidateData,
          mapJobTagData: mapJobTagData);
      print('bh');
    } catch (e) {
      yield KanbanInitialState();
      print(e.toString());
    }
  }

  Stream<KanbanState> _mapKanbanStarToState(KanbanStarEvent event) async* {
    print("${event.value},${event.mongoid}");
    yield KanbanLoadingState();
    try {
      await CandidateCvInfoService()
          .starCandidateMark(event.mongoid, event.value)
          .then((value) {
        print("map-->$value");
      });

      yield KanbanInitialState();
      print('bh');
    } catch (e) {
      yield KanbanInitialState();
      print(e.toString());
    }
  }

  Stream<KanbanState> _mapKanbanUnreadToState(KanbanUnreadEvent event) async* {
    try {
      await CandidateCvInfoService()
          .MarkUnreadCandidate(
        event.mongoid,
      )
          .then((value) {
        print("map-->$value");
      });

      print('bh1');
      yield KanbanInitialState();
      print('bh');
    } catch (e) {
      yield KanbanInitialState();
      print(e.toString());
    }
  }

  Stream<KanbanState> _mapKanbanReadToState(KanbanReadEvent event) async* {
    try {
      await CandidateCvInfoService()
          .MarkReadCandidate(
        event.mongoid,
      )
          .then((value) {
        print("map-->$value");
      });

      print('bh1');
      yield KanbanInitialState();
      print('bh');
    } catch (e) {
      yield KanbanInitialState();
      print(e.toString());
    }
  }

  Stream<KanbanState> _mapKanbanRejectToState(KanbanRejectEvent event) async* {
    RejectReasonModel reasonLists;
    yield KanbanLoadingState();
    try {
      await CandidateCvInfoService().RejectCandidate().then((value) {
        reasonLists = value;
        print("map-->$value");
      });

      print('bh1');
      yield KanbanRejectReasonState(rejectReasons: reasonLists);
      print('bh');
    } catch (e) {
      yield KanbanInitialState();
      print(e.toString());
    }
  }

  // Stream<KanbanState> _mapKanbanUnreadToState(KanbanUnreadEvent event) async* {
  //   try {
  //     print("Enter in try block");
  //     Map mapCandidateData = new Map();

  //     await kanbanAuthService
  //         .getCandididateUnreadCvInfo(event.jobProfileId, event.limit,
  //             event.page, event.listJobTagId, event.unread)
  //         .then((value) {
  //       print("mappppp-->$value");
  //       Map map = new Map();
  //       value.forEach((element) => map = element);
  //       // for (var i in value) {
  //       //   map = value[i];
  //       //   print("mjioifu---->${value[i]}");
  //       // }
  //       //map = value;
  //       print("mapppppp---->$map");
  //       mapCandidateData.addAll(map);
  //       print("------>mapCabuguiondidateData-->$mapCandidateData");

  //       map.clear();
  //     });

  //     print('bh1');
  //     yield KanbanUnreadPageState(
  //       jobToken: event.jobProfileId,
  //       mapCandidateData: mapCandidateData,
  //     );
  //     print('bh');
  //   } catch (e) {
  //     yield KanbanInitialState();
  //     print("e.toString()==>${e.toString()}");
  //   }
  // }
}
