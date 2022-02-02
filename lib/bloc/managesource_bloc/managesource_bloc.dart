import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/managesource_bloc/managesource_event.dart';
import 'package:flutter_product_recruit/bloc/managesource_bloc/managesource_state.dart';
import 'package:flutter_product_recruit/services/managesource_service.dart';

class ManageSourceBloc extends Bloc<ManageSourceEvent, ManageSourceState> {
  ManageSourceBloc() : super(ManageSourceInitialState());
  @override
  Stream<ManageSourceState> mapEventToState(ManageSourceEvent event) async* {
    if (event is ManageSourceInitialEvent) {
      yield* _mapManageSourceEvent(event);
    }
  }

  Stream<ManageSourceState> _mapManageSourceEvent(
      ManageSourceInitialEvent event) async* {
    print("Initial state fetch manage source list");
    try {
      GetManageSourceService getManageSorceService =
          new GetManageSourceService();
      var res = await getManageSorceService.getSourcesList();

      yield GetManageSourceState(managesourcelists: res);
    } catch (e) {
      yield ManageSourceFailureState();
    }
  }
}
