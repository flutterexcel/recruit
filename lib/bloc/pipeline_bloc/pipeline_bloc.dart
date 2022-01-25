import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/pipeline_bloc/pipeline_event.dart';
import 'package:flutter_product_recruit/bloc/pipeline_bloc/pipeline_state.dart';
import 'package:flutter_product_recruit/services/pipeline_service.dart';

class PipeLineBloc extends Bloc<PipeLineEvent, PipeLineState> {
  PipeLineBloc() : super(PipeLineInitialState());
  @override
  Stream<PipeLineState> mapEventToState(PipeLineEvent event) async* {
    if (event is PipeLineInitialState) {
      print("Initial state fetch pipeline");

      yield* _mapPipeLineEvent(event);
    }
  }

  Stream<PipeLineState> _mapPipeLineEvent(PipeLineInitialEvent event) async* {
    print("Initial state fetch pipeline");
    try {
      GetPipeLineService getPipeLineService = new GetPipeLineService();
      var res = await getPipeLineService.getPipeLine();
      print("Initial state fetch pipeline");

      yield GetPipeLineState(pipeLine: res);
    } catch (e) {
      print("Initial stte fetch pipeline");

      yield PipeLineFailureState();
    }
  }
}
