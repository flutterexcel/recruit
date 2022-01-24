import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_product_recruit/model/permission/permisson.dart';
import 'package:flutter_product_recruit/services/permissions_services/permissions_service.dart';

//** Events of Permisson  */
abstract class PermissionEvent extends Equatable {
  const PermissionEvent();
  @override
  List<Object> get props => [];
}

class PermissionInitialEvent extends PermissionEvent {}

//** State of permission  */

abstract class PermissionState extends Equatable {
  PermissionState();

  @override
  List<Object> get props => [];
}

class PermissionInitialState extends PermissionState {}

// ignore: must_be_immutable
class GetPermission extends PermissionState {
  List<Datum> dataList = [];

  GetPermission({this.dataList});

  @override
  List<Object> get props => [dataList];
}

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitialState());

  @override
  Stream<PermissionState> mapEventToState(PermissionEvent event) async* {
    if (event is PermissionInitialEvent) {
      yield* mapPermissionInitialEventToState(event);
    }
  }

  Stream<PermissionState> mapPermissionInitialEventToState(
      PermissionInitialEvent event) async* {
    print("initial event");
    List<Datum> data = [];
    try {
      var res = await PermissionService.GetPermission();
      data = res.data;
      yield GetPermission(dataList: data);
    } catch (e) {}
  }
}
