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
    if (event is UserLogBlocEventInitial) {
      yield* _mapuserBlocInitialToState(event);
    }
  }

  Stream<UserLogState> _mapuserBlocInitialToState(
      UserLogBlocEventInitial event) async* {
    List<Datum> data = [];

    try {
      var res = await UserLogsAuth.getUserLogList(StorageUtil.getToken());
      // print("user log data ${res.data}");
      data = res.data;

      yield UserLogViewState(userLog: data);
    } catch (e) {}
  }
}
