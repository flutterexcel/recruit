import 'package:equatable/equatable.dart';
import 'package:flutter_product_recruit/model/pipeline_model.dart';

abstract class PipeLineState extends Equatable {
  PipeLineState();
  List<Object> get props => [];
}

class PipeLineInitialState extends PipeLineState {}

// ignore: must_be_immutable
class GetPipeLineState extends PipeLineState {
  List<GetPipelineModel> pipeLine;

  GetPipeLineState({this.pipeLine});

  List<Object> get props => [pipeLine];
}

class PipeLineFailureState extends PipeLineState {}
