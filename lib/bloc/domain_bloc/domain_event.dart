part of '../domain_bloc/domain_bloc.dart';

abstract class DomainEvent extends Equatable {
  const DomainEvent();

  @override
  List<Object> get props => [];
}

class DomainInitialEvenet extends DomainEvent{}
class LoginWIthDomain extends DomainEvent {
  String domain;
  LoginWIthDomain({this.domain});
  List<Object> get props => [domain];
}

class ReLoginWithDomain extends DomainEvent{}
class DomainLogOut extends DomainEvent{}
