part of 'kanban_bloc.dart';

abstract class KanbanState extends Equatable {
  const KanbanState();

  @override
  List<Object> get props => [];
}

class KanbanInitialState extends KanbanState {}

class KanbanPageState extends KanbanState {
  Map<String, JobTagData> mapJobTagData = new Map();
  String title;
  Map<String, CandidateCvInfoModel> mapCandidateData = new Map();
  List<JobTag> listJobTag;
  KanbanPageState({this.listJobTag, this.title, this.mapCandidateData,this.mapJobTagData});
}
