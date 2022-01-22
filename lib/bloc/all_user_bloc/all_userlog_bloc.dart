import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_events.dart';
import 'package:flutter_product_recruit/bloc/all_user_bloc/all_userlog_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/userlist_model.dart';
import 'package:flutter_product_recruit/services/userlist_services/get_userlist_service.dart';

class AllUserLogBloc extends Bloc<AllUserLogEvent, AllUserLogState> {
  AllUserLogBloc() : super(AllUserLogInitialState());

  @override
  Stream<AllUserLogState> mapEventToState(AllUserLogEvent event) async* {
    if (event is AllUserLogDropdown) {
      print('AllUserLogDropdown');
      yield* _mapAllUserLogDropdownState(event);
    }
    // if (event is AllUserLogInitialEvent) {
    //   print("AllUserLogInitialEvent");
    // }
  }

  Stream<AllUserLogState> _mapAllUserLogDropdownState(
      AllUserLogDropdown event) async* {
    List<UserListsModel> userslist;

    try {
      await GetUserListService.getUserList().then((value) {
        userslist = value;
      });
      yield AllUserLogDropdownState(usersList: userslist);
    } catch (e) {}
  }
}
