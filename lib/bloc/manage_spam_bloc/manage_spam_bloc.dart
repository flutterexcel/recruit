import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_state.dart';
import 'package:flutter_product_recruit/services/manage_spam/manage_spam.dart';

class ManageSpamBloc extends Bloc<ManageSpamEvent, MangeSpamState> {
  ManageSpamBloc() : super(MangeSpamInitial());

  @override
  Stream<MangeSpamState> mapEventToState(ManageSpamEvent event) async* {
    if (event is ManageSpamInitialEvent) {
      yield* _mapManageSpamInitialEvent(event);
    }
    if (event is AddEmailEvent) {
      print("add event");
      yield* _mapAddEmailToState(event);
    }
  }

  Stream<MangeSpamState> _mapManageSpamInitialEvent(
      ManageSpamInitialEvent event) async* {
    try {
      var res = await ManageSpamService.getManageSpamEmail();

      yield GetSpamList(managelist: res);
    } catch (e) {
      yield ManageSpamFailure();
    }
  }

  Stream<MangeSpamState> _mapAddEmailToState(AddEmailEvent event) async* {
    try {  
      var res = await ManageSpamService.addManageSpamEmail(event.email);
      print("response of add spam");
      yield AddEmailSuccess(addemailModel: res);
    } catch (e) {           
      yield ManageSpamFailure();
    }
  }
}
