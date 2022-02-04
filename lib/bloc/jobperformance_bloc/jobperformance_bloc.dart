import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/jobperformance_bloc/jobperformance_event.dart';
import 'package:flutter_product_recruit/bloc/jobperformance_bloc/jobperformance_state.dart';
import 'package:flutter_product_recruit/services/jobperformance_service.dart';

class JobPerformanceBloc
    extends Bloc<JobPerformanceEvent, JobPerformanceState> {
  JobPerformanceBloc() : super(JobPerformanceInitialState());
  @override
  Stream<JobPerformanceState> mapEventToState(
      JobPerformanceEvent event) async* {
    if (event is JobPerformanceInitialEvent) {
      yield* _mapJobPerformanceEvent(event);
    }
  }

  Stream<JobPerformanceState> _mapJobPerformanceEvent(
      JobPerformanceInitialEvent event) async* {
    print("Initial state");
    try {
      GetJobPerformanceService getJobPerformanceService =
          new GetJobPerformanceService();
      var res = await getJobPerformanceService.getJobPerformanceList(event.id);
      // print("res$res");
      //var res2 = await GetUserListService.getUserList();

      yield GetJobPerformanceState(jobpPerformanceLists: res);
    } catch (e) {
      print("error in catch");
      print(e.toString());
      yield JobPerformanceFailureState();
    }
  }
}
