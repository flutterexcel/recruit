import 'package:equatable/equatable.dart';

abstract class AllUserLogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AllUserLogInitialEvent extends AllUserLogEvent {}

class AllUserLogDropdown extends AllUserLogEvent {}
