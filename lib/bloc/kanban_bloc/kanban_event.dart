// ignore_for_file: must_be_immutable

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

// class KanbanUnreadEvent extends KanbanEvent {
//   String jobProfileId;
//   int limit;
//   int page;
//   String listJobTagId;
//   bool unread;

//   KanbanUnreadEvent(
//       this.jobProfileId, this.limit, this.page, this.listJobTagId, this.unread);
// }
class KanbanStarEvent extends KanbanEvent {
  String mongoid;
  bool value;
  KanbanStarEvent({this.mongoid, this.value});
}

class KanbanUnreadEvent extends KanbanEvent {
  String mongoid;

  KanbanUnreadEvent({
    this.mongoid,
  });
}

class KanbanReadEvent extends KanbanEvent {
  String mongoid;

  KanbanReadEvent({
    this.mongoid,
  });
}

class KanbanNoteEvent extends KanbanEvent {
  String candidateLink;
  String mongo_id;
  String note;
  List userData;

  KanbanNoteEvent(
      {this.mongo_id, this.candidateLink, this.note, this.userData});
}

class KanbanRejectEvent extends KanbanEvent {}
