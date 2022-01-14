import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_state.dart';
import 'package:flutter_product_recruit/services/manage_spam/get_spam_services.dart';

class ManageSpamBloc extends Bloc<ManageSpamEvent, MangeSpamState> {
  ManageSpamBloc() : super(MangeSpamInitial());

  @override
  Stream<MangeSpamState> mapEventToState(ManageSpamEvent event) async* {
    if (event is ManageSpamInitialEvent) {
      yield* _mapManageSpamInitialEvent(event);
    }
  }

  Stream<MangeSpamState> _mapManageSpamInitialEvent(
      ManageSpamInitialEvent event) async* {
    try {
      var res = await GetEmailSpamService.getSpamEmail();
      yield GetSpamList(managelist: res);
    } catch (e) {
      yield ManageSpamFailure();
    }
  }
}
