// part of 'user_log_bloc.dart';

  import 'package:equatable/equatable.dart';

abstract class UserLogBlocEvent extends Equatable {
  const UserLogBlocEvent();

  @override
  List<Object> get props => [];
}

class UserLogBlocEventInitial extends UserLogBlocEvent {}
