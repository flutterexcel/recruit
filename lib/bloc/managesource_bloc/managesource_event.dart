import 'package:equatable/equatable.dart';

abstract class ManageSourceEvent extends Equatable {
  ManageSourceEvent();
  List<Object> get props => [];
}

class ManageSourceInitialEvent extends ManageSourceEvent {}
