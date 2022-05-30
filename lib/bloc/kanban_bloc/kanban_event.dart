part of 'kanban_bloc.dart';

abstract class KanbanEvent extends Equatable {
  const KanbanEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class KanbanInitialEvent extends KanbanEvent {
  String title;
  String jobToken;
  List<JobTag> _listJobTag;
  KanbanInitialEvent(this._listJobTag, this.title, this.jobToken);
}
