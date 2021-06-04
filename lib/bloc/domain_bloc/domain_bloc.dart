import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/domain_model.dart';
import 'package:flutter_product_recruit/services/login_apis/login_authentication_services.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';

part 'domain_event.dart';
part 'domain_state.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  DomainBloc() : super(DomainInitial());
  AuthenticationService authenticationService = new AuthenticationService();

  @override
  Stream<DomainState> mapEventToState(
    DomainEvent event,
  ) async* {
    if (event is DomainInitialEvenet) {
      yield* _mapDomainInitialLoginWithDomaintoState(event);
    }
    if (event is LoginWIthDomain) {
      yield* _mapLoginWithDomainToState(event);
    }
    if (event is ReLoginWithDomain) {
      yield* _mapReLoginWithDomaintoState(event);
    }
  }

  Stream<DomainState> _mapDomainInitialLoginWithDomaintoState(
      DomainInitialEvenet event) async* {
        
    try {
      var data = await authenticationService.domainApi(StorageUtil.getDomain());
      yield DomainSuccess(domainModel: data);
    } catch (e) {
      yield DomainLoginState();
    }
  }

  Stream<DomainState> _mapLoginWithDomainToState(LoginWIthDomain event) async* {
    try {
      var data = await authenticationService.domainApi(event.domain);
      StorageUtil.setDomain(event.domain);
      StorageUtil.setLogo(data.image.faviconImage);
      yield DomainSuccess(domainModel: data);
    } catch (e) {
      yield DomainFailure();
    }
  }

  Stream<DomainState> _mapReLoginWithDomaintoState(
      ReLoginWithDomain event) async* {
    yield DomainInitial();
  }
}
