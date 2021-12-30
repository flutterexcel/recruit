import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/user_logs_bloc/user_log_event.dart';
import 'package:flutter_product_recruit/bloc/user_logs_bloc/user_log_state.dart';
import 'package:flutter_product_recruit/model/userLog/user_log.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'package:flutter_product_recruit/services/user_logs/user_logs_auth.dart';

class UserLogBloc extends Bloc<UserLogBlocEvent, UserLogState> {
  UserLogBloc() : super(UserLogStateInitial());
  UserLogsAuth userlogsauth = new UserLogsAuth();

  @override
  Stream<UserLogState> mapEventToState(UserLogBlocEvent event) async* {
    // TODO: implement mapEventToState
    if (event is UserLogBlocEventInitial) {
      yield* _mapuserBlocInitialToState(event);
    }
  }

  Stream<UserLogState> _mapuserBlocInitialToState(
      UserLogBlocEvent event) async* {
    List<UserLog> data;

    try {
      await userlogsauth.getUserLogList(StorageUtil.getToken()).then((value) {
        data = value;
      });

      yield UserLogViewState(userLog: data);
    } catch (e) {}
  }
}
