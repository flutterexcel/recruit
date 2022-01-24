import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_event.dart';
import 'package:flutter_product_recruit/bloc/application_status_bloc/application_status_state.dart';
import 'package:flutter_product_recruit/services/application_status_service.dart';

class ApplicationStatusBloc
    extends Bloc<ApplicationStatusEvent, ApplicationStatusState> {
  ApplicationStatusBloc() : super(ApplicationStatusInitialState());
  @override
  Stream<ApplicationStatusState> mapEventToState(
      ApplicationStatusEvent event) async* {
    if (event is ApplicationStatusInitialEvent) {
      yield* _mapApplicationStatusEvent(event);
    }
  }

  Stream<ApplicationStatusState> _mapApplicationStatusEvent(
      ApplicationStatusInitialEvent event) async* {
    print("Initial state");
    try {
      GetApplicationStatusService getApplicatonStatusService =
          new GetApplicationStatusService();
      var res = await getApplicatonStatusService.getApplicationStatus();

      yield GetApplicationStatusState(applicationStatusList: res);
    } catch (e) {
      yield ApplicationStatusFailureState();
    }
  }
}
