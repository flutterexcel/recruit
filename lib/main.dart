import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/bloc/domain_bloc/domain_bloc.dart';
import 'package:flutter_product_recruit/bloc/jobs_overview_bloc/jobs_overview_bloc.dart';
import 'package:flutter_product_recruit/screens/7_step_screens/step5/step5.dart';

import 'package:flutter_product_recruit/screens/domainLogin.dart';
import 'package:flutter_product_recruit/screens/login.dart';
import 'package:flutter_product_recruit/screens/manage_emails/manage_emails.dart';
import 'package:flutter_product_recruit/screens/manage_spams/manage_spams.dart';
import 'package:flutter_product_recruit/services/storage_service.dart';
import 'bloc/kanban_bloc/kanban_bloc.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'bloc/manage_spam_bloc/manage_spam_bloc.dart';
import 'bloc/user_logs_bloc/user_log_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DomainBloc>(
          create: (context) => DomainBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => JobsOverviewBlocBloc(),
        ),
        BlocProvider(
          create: (context) => KanbanBloc(),
        ),
        BlocProvider<UserLogBloc>(
          create: (context) => UserLogBloc(),
        ),
        BlocProvider<ManageSpamBloc>(
          create: (context) => ManageSpamBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Recruit AI',
        home: RecruiterApp(),
      ),
    );
  }
}

class RecruiterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  return DomainLogin();
    return Login();
  }
}
