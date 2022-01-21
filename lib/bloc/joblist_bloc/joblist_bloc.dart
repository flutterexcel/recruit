import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_event.dart';
import 'package:flutter_product_recruit/bloc/joblist_bloc/joblist_state.dart';
import 'package:flutter_product_recruit/services/getjoblist_service.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  JobListBloc() : super(JobListInitialState());
  @override
  Stream<JobListState> mapEventToState(JobListEvent event) async* {
    if (event is JobListInitialEvent) {
      yield* _mapJobListEvent(event);
    }
  }

  Stream<JobListState> _mapJobListEvent(JobListInitialEvent event) async* {
    print("Initial state");
    try {
      var res = await GetJobListService.getJobList();

      yield GetJobListState(jobLists: res);
    } catch (e) {
      yield JobListFailureState();
    }
  }
}
