// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class JobPerformanceEvent extends Equatable {
  JobPerformanceEvent();
  List<Object> get props => [];
}

class JobPerformanceInitialEvent extends JobPerformanceEvent {
  String id;
  JobPerformanceInitialEvent(this.id);
}
