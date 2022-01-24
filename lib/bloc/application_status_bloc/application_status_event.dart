import 'package:equatable/equatable.dart';

abstract class ApplicationStatusEvent extends Equatable {
  ApplicationStatusEvent();
  List<Object> get props => [];
}

class ApplicationStatusInitialEvent extends ApplicationStatusEvent {}
