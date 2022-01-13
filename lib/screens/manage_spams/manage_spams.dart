import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_bloc.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_event.dart';
import 'package:flutter_product_recruit/bloc/manage_spam_bloc/manage_spam_state.dart';
import 'package:flutter_product_recruit/screens/manage_spams/add_new_spam_contact.dart';
import 'package:flutter_product_recruit/screens/manage_spams/confirm_delete_spam_dialouge.dart';
import 'package:flutter_product_recruit/screens/manage_spams/update_contact_dialouge.dart';
import 'package:flutter_product_recruit/services/manage_spam/get_spam_email_services.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/loader.dart';
import 'package:flutter_product_recruit/widgets/loader1.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/navigation.dart';
import 'package:flutter_product_recruit/widgets/text.dart';

// ignore: must_be_immutable
class Manage_Spams extends StatefulWidget {
  @override
  State<Manage_Spams> createState() => _Manage_SpamsState();
}

// ignore: camel_case_types
class _Manage_SpamsState extends State<Manage_Spams> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getspam();
  }

  void getspam() async {
    var res = await GetEmailSpamService.getManageSpamEmail();
    data = res;
    print(data);
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Update_Contact());
        });
  }

  void _popupConfirmDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: DeleteSpam(id: id));
        });
  }

  void _popupAddNewSpamDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: Add_New_Spam());
        });
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageSpamBloc, MangeSpamState>(
        builder: (context, state) {
      if (state is MangeSpamInitial) {
        context.bloc<ManageSpamBloc>().add(ManageSpamInitialEvent());
        return Loader1();
      } else if (state is GetSpamList) {
        // print("state${state.managelist.length}");
        return Scaffold(
          drawer: NavigationList(),
          appBar: SecondAppBar(
              text: "Add Spam",
              title: "Manage Spams",
              onPressed: () {
                _popupAddNewSpamDialog(context);
              }),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: state.managelist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Contain(
                  outlinecolor: AppColors.grey,
                  borderrad: 8,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orange12,
                        ),
                        child: Text(
                          state.managelist[index].email[0].toUpperCase(),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Textt(
                        text: state.managelist[index].email,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                              scale: 0.6,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _popupDialog(context);
                                    });
                                  },
                                  child: Icon(Icons.edit))),
                          const SizedBox(
                            width: 20,
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _popupConfirmDialog(
                                        context, data[index].id);
                                  });
                                },
                                child: Icon(Icons.delete)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
