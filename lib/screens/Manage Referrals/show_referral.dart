import 'package:flutter/material.dart';

import 'package:flutter_product_recruit/UiConstant/app_colors.dart';

import 'package:flutter_product_recruit/screens/Manage%20Referrals/add_referal.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/confirm_delete_referral_dialouge.dart';
import 'package:flutter_product_recruit/screens/Manage%20Referrals/edit_referral.dart';
import 'package:flutter_product_recruit/services/manage_referral/add_referral_services.dart';
import 'package:flutter_product_recruit/services/manage_referral/get_referal_services.dart';
import 'package:flutter_product_recruit/widgets/container.dart';
import 'package:flutter_product_recruit/widgets/navigation_list.dart';
import 'package:flutter_product_recruit/widgets/second_app_bar..dart';
import 'package:flutter_product_recruit/widgets/text.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class GetReferrals extends StatefulWidget {
  @override
  State<GetReferrals> createState() => _GetReferralsState();
}

// ignore: camel_case_types
class _GetReferralsState extends State<GetReferrals> {
  void _popupDialog(BuildContext context, updates) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: ChangeNotifierProvider(
                  create: (context) => AddReferralService(),
                  child: EditReferral(update: updates)));
        });
  }

  void _popupConfirmDialog(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: DeleteReferral(id: id));
        });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<GetReferralEmailService>(context, listen: false)
        .getReferralEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationList(),
        appBar: SecondAppBar(
            text: "Add Referral",
            title: "Manage Referral",
            onPressed: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<AddReferralService>(
                          create: (BuildContext context) =>
                              AddReferralService(),
                          child: Add_Referal(),
                        )));
              });
            }),
        // appBar: AppBar(
        //   title: const Text("Manage Referral"),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 15.0),
        //       child: Container(
        //         // margin: EdgeInsets.symmetric(vertical: 10),
        //         child: InkWell(
        //           child: Row(
        //             children: [
        //               Icon(Icons.add, color: AppColors.white),
        //               Text("Add Referral"),
        //             ],
        //           ),
        //           onTap: () {
        //             setState(() {
        //               Navigator.of(context).push(MaterialPageRoute(
        //                   builder: (context) =>
        //                       ChangeNotifierProvider<AddReferralService>(
        //                         create: (BuildContext context) =>
        //                             AddReferralService(),
        //                         child: Add_Referal(),
        //                       )));
        //             });
        //           },
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // drawer: NavigationList(),s
        body: Consumer<GetReferralEmailService>(
          builder: (context, states, child) {
            print(states.referralList.length);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: states.referralList.length,
              itemBuilder: (context, index) {
                var dater = states.referralList[index].createdAt;
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
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.orange12,
                          ),
                          child: Center(
                            child: Text(
                              states.referralList[index].email[0]
                                  .toString()
                                  .toUpperCase(),
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Textt(text: states.referralList[index].email),
                        const SizedBox(
                          height: 5,
                        ),
                        Textt(
                          text: DateFormat('MMM:dd').format(dater),
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
                                        _popupDialog(context,
                                            states.referralList[index]);
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
                                      _popupConfirmDialog(context,
                                          states.referralList[index].id);
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
            );
          },
        ));
  }
}
// // ignore_for_file: missing_return

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_product_recruit/UiConstant/app_colors.dart';
// import 'package:flutter_product_recruit/bloc/manage_referral_bloc/manage_referral_bloc.dart';
// import 'package:flutter_product_recruit/bloc/manage_referral_bloc/manage_referral_event.dart';
// import 'package:flutter_product_recruit/bloc/manage_referral_bloc/manage_referral_state.dart';
// import 'package:flutter_product_recruit/screens/Manage%20Referrals/Manage_Referral.dart';
// import 'package:flutter_product_recruit/screens/Manage%20Referrals/add_referal.dart';
// import 'package:flutter_product_recruit/screens/manage_spams/confirm_delete_spam_dialouge.dart';
// import 'package:flutter_product_recruit/screens/manage_spams/update_contact_dialouge.dart';
// import 'package:flutter_product_recruit/services/manage_referral/get_referal_services.dart';
// import 'package:flutter_product_recruit/widgets/container.dart';
// import 'package:flutter_product_recruit/widgets/text.dart';
// import 'package:intl/intl.dart';

// // ignore: must_be_immutable, camel_case_types
// class GetReferrals extends StatefulWidget {
//   @override
//   State<GetReferrals> createState() => _GetReferralsState();
// }

// // ignore: camel_case_types
// class _GetReferralsState extends State<GetReferrals> {
//   List data = [];

//   void _popupDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Dialog(child: Update_Contact());
//         });
//   }

//   void _popupConfirmDialog(BuildContext context, String id) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Dialog(child: DeleteSpam(id: id));
//         });
//   }

//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ManageReferralBloc, ManageReferralState>(
//         builder: (context, state) {
//       if (state is ManageReferralInitialState) {
//         context.bloc<ManageReferralBloc>().add(ManageReferralInitialEvent());
//       } else if (state is ManageReferralLoadingState) {
//         return Center(child: CircularProgressIndicator());
//       } else if (state is GetReferralList) {
//         // if (state.referralList.length == 0) {
//         //   return Manage_Referral();
//         // }
//         // else
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Manage Referral"),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 15.0),
//                 child: Container(
//                   // margin: EdgeInsets.symmetric(vertical: 10),
//                   child: InkWell(
//                     child: Row(
//                       children: [
//                         Icon(Icons.add, color: AppColors.white),
//                         Text("Add Referral"),
//                       ],
//                     ),
//                     onTap: () {
//                       setState(() {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => Add_Referal()));
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // drawer: NavigationList(),s
//           body: ListView.builder(
//             shrinkWrap: true,
//             itemCount: state.referralList.length,
//             itemBuilder: (context, index) {
//               var dater = state.referralList[index].createdAt;
//               return Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Contain(
//                   outlinecolor: AppColors.grey,
//                   borderrad: 8,
//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: AppColors.orange12,
//                         ),
//                         child: Text(state.referralList[index].email[0]
//                             .toString()
//                             .toUpperCase()),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Textt(
//                         text: state.referralList[index].email,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Textt(
//                         text: DateFormat('dd:MM:yyyy').format(dater),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Transform.scale(
//                               scale: 0.6,
//                               child: InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       _popupDialog(context);
//                                     });
//                                   },
//                                   child: Icon(Icons.edit))),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Transform.scale(
//                             scale: 0.6,
//                             child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     _popupConfirmDialog(
//                                         context, state.referralList[index].id);
//                                   });
//                                 },
//                                 child: Icon(Icons.delete)),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }
//     });
//   }
// }

