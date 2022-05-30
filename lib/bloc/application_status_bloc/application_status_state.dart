import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/job_candidate_model.dart';

abstract class ApplicationStatusState extends Equatable {
  ApplicationStatusState();
  List<Object> get props => [];
}

class ApplicationStatusInitialState extends ApplicationStatusState {}

// ignore: must_be_immutable
class GetApplicationStatusState extends ApplicationStatusState {
  List<Datum> applicationStatusList;

  GetApplicationStatusState({this.applicationStatusList});

  List<Object> get props => [applicationStatusList];
}

class ApplicationStatusFailureState extends ApplicationStatusState {}
