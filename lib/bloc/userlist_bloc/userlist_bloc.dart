import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_event.dart';
import 'package:flutter_product_recruit/bloc/userlist_bloc/userlist_state.dart';
import 'package:flutter_product_recruit/model/userlist_model/delete_userlist_model.dart';
import 'package:flutter_product_recruit/services/userlist_services/delete_userlist_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/get_userlist_service.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitialState());
  @override
  Stream<UserListState> mapEventToState(UserListEvent event) async* {
    if (event is UserListInitialEvent) {
      yield* _mapUserListEvent(event);
    } else if (event is DeleteUserEvent) {
      yield* _mapDeleteUserEvent(event);
    }
  }

  Stream<UserListState> _mapUserListEvent(UserListInitialEvent event) async* {
    print("Initial state fetch user list");
    try {
      var res = await GetUserListService.getUserList();

      yield GetUserListState(userLists: res);
    } catch (e) {
      yield UserListFailureState();
    }
  }

  Stream<UserListState> _mapDeleteUserEvent(DeleteUserEvent event) async* {
    print("User Delete Event");
    print(event.id);
    var res = await DeleteUserService.deleteUser(event.id);
    print("-->$res");
    //yield GetUserListState(userLists: res);
  }
}
