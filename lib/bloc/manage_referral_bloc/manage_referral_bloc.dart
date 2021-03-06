// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_product_recruit/bloc/manage_referral_bloc/manage_referral_event.dart';
// import 'package:flutter_product_recruit/bloc/manage_referral_bloc/manage_referral_state.dart';
// import 'package:flutter_product_recruit/services/manage_referral/add_referral_services.dart';
// import 'package:flutter_product_recruit/services/manage_referral/get_referal_services.dart';

// class ManageReferralBloc
//     extends Bloc<ManagerReferralEvent, ManageReferralState> {
//   ManageReferralBloc() : super(ManageReferralInitialState());

//   @override
//   Stream<ManageReferralState> mapEventToState(
//       ManagerReferralEvent event) async* {
//     if (event is ManageReferralInitialEvent) {
//       yield ManageReferralLoadingState();
//       yield* _mapManageReferralInitialEvent(event);
//     } else if (event is AddReferralEvent) {
//       yield* _mapAddReferralEvent(event);
//     }
//   }

//   Stream<ManageReferralState> _mapManageReferralInitialEvent(
//       ManageReferralInitialEvent event) async* {
//     try {
//       GetReferralEmailService getReferralEmailService =
//           new GetReferralEmailService();
//       var res = await getReferralEmailService.getReferralEmail();
//       yield GetReferralList(referralList: res);
//     } catch (e) {
//       yield ManageReferralFailure();
//     }
//   }

//   Stream<ManageReferralState> _mapAddReferralEvent(
//       AddReferralEvent event) async* {
//     try {
//       AddReferralService addReferralService = new AddReferralService();
//       var res = await addReferralService.addReferralEmail(event.email);
//       //  yield AddManageReferral(referralList: res);
//     } catch (e) {
//       yield ManageReferralFailure();
//     }
//   }
// }
