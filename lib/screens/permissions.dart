import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/UiConstant/utils.dart';
import 'package:flutter_product_recruit/bloc/permission_bloc/permission_bloc.dart';
import 'package:flutter_product_recruit/model/permission/permisson.dart';
import 'package:flutter_product_recruit/model/permission/set_permission_model.dart';
import 'package:flutter_product_recruit/services/permissions_services/permissions_service.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Permis extends StatefulWidget {
  @override
  State<Permis> createState() => _PermisState();
}

class _PermisState extends State<Permis> {
  bool isSwitched;

  // List<Datum> dataList = [];

  // List<Configuration> configList = [];

  // getData() async {
  //   var res = await PermissionService.GetPermission();

  //   setState(() {
  //     dataList = res.data;
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionBloc, PermissionState>(
        // ignore: missing_return
        builder: (context, state) {
      if (state is PermissionInitialState) {
        // ignore: deprecated_member_use
        context.bloc<PermissionBloc>().add(PermissionInitialEvent());
        return Loader1();
      } else if (state is GetPermission) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Permissions"),
            ),
            drawer: NavigationList(),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: state.dataList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Textt(
                                  text: state.dataList[index].configHeading,
                                  size: 15,
                                  fweight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                // height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: state
                                        .dataList[index].configurations.length,
                                    itemBuilder:
                                        (BuildContext context, index2) {
                                      isSwitched = state.dataList[index]
                                          .configurations[index2].isChecked;

                                      return Row(
                                        children: [
                                          Expanded(
                                              child: Text(state.dataList[index]
                                                  .configurations[index2].title
                                                  .toString())),
                                          Expanded(
                                            child: Switch(
                                              value: isSwitched,
                                              onChanged: (value) async {
                                                if (isSwitched) {
                                                  SetPermissionModel res =
                                                      await PermissionService
                                                          .removePermission(
                                                    state
                                                        .dataList[index]
                                                        .configurations[index2]
                                                        .accessCode,
                                                    state.dataList[index]
                                                        .configHeading,
                                                  );

                                                  Utils.showSnackBar(
                                                      context,
                                                      res.message,
                                                      AppColors.warning);

                                                  context
                                                      .bloc<PermissionBloc>()
                                                      .add(
                                                          PermissionInitialEvent());
                                                } else {
                                                  SetPermissionModel res =
                                                      await PermissionService
                                                          .setPermission(
                                                    state
                                                        .dataList[index]
                                                        .configurations[index2]
                                                        .accessCode,
                                                    state.dataList[index]
                                                        .configHeading,
                                                  );

                                                  Utils.showSnackBar(
                                                      context,
                                                      res.message,
                                                      AppColors.Green);
                                                  context
                                                      .bloc<PermissionBloc>()
                                                      .add(
                                                          PermissionInitialEvent());
                                                }
                                              },
                                              activeTrackColor:
                                                  const Color(0xFF00E5FF),
                                              activeColor:
                                                  const Color(0xFF00E5FF),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ));
      }
    });
  }
}
