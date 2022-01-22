import 'package:equatable/equatable.dart';

abstract class AllUserLogEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AllUserLogInitialEvent extends AllUserLogEvent {}

class AllUserLogDropdown extends AllUserLogEvent {}
