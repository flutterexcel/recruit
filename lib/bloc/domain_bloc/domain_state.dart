part of '../domain_bloc/domain_bloc.dart';

abstract class DomainState extends Equatable {
  const DomainState();

  @override
  List<Object> get props => [];
}

class DomainInitial extends DomainState {}

class DomainLoginState extends DomainState {}

class DomainFailure extends DomainState {}

// ignore: must_be_immutable
class DomainSuccess extends DomainState {
  DomainModel domainModel;
  DomainSuccess({this.domainModel});
}
