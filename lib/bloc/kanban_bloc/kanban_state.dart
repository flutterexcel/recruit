// ignore_for_file: must_be_immutable

part of 'kanban_bloc.dart';

abstract class KanbanState extends Equatable {
  const KanbanState();

  @override
  List<Object> get props => [];
}

class KanbanInitialState extends KanbanState {}

class KanbanRejectReasonState extends KanbanState {
  RejectReasonModel rejectReasons;
  KanbanRejectReasonState({this.rejectReasons});
}

// ignore: must_be_immutable
class KanbanPageState extends KanbanState {
  Map<String, JobTagData> mapJobTagData = new Map();
  String title;
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  String jobToken;

  List<JobTag> listJobTag;
  KanbanPageState(
      {this.listJobTag,
      this.title,
      this.mapCandidateData,
      this.mapJobTagData,
      this.jobToken});
}

// class KanbanUnreadPageState extends KanbanState {
//   Map mapCandidateData = new Map();
//   String jobToken;

//   KanbanUnreadPageState({this.mapCandidateData, this.jobToken});
// }
