import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_state.dart';
import 'package:flutter_product_recruit/services/manage_spam/manage_spam_service.dart';

class ManageSpamBloc extends Bloc<ManageSpamEvent, MangeSpamState> {
  ManageSpamBloc() : super(MangeSpamInitial());

  @override
  Stream<MangeSpamState> mapEventToState(ManageSpamEvent event) async* {
    if (event is ManageSpamInitialEvent) {
      yield* _mapManageSpamInitialEvent(event);
    }

    // if (event is AddEmailEvent) {
    //   print("add event");
    //   yield* _mapAddEmailToState(event);
    // }
  }
             
  Stream<MangeSpamState> _mapManageSpamInitialEvent(
      ManageSpamInitialEvent event) async* {
    print("initial");
    try {
      var res = await ManageSpamService.getManageSpamEmail();

      yield GetSpamList(managelist: res);
    } catch (e) {
      yield ManageSpamFailure();
    }
  }

  // Stream<MangeSpamState> _mapAddEmailToState(AddEmailEvent event) async* {
  //   try {
  //     var res1 = await ManageSpamService.getManageSpamEmail();
  //     var res2 = await ManageSpamService.addManageSpamEmail(event.email);
  //     print("response of add spam--${res2}");
  //     print("response of get spam---${res1}");
  //     yield GetSpamList(
  //       managelist: res1,
  //       addemailModel: res2,
  //     );
  //   } catch (e) {
  //     yield ManageSpamFailure();
  //   }
  // }
}
