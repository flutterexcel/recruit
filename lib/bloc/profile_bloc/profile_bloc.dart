// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_product_recruit/model/profile/update_profile.dart';
import 'package:flutter_product_recruit/services/profile/update_profile_service.dart';
import 'package:flutter_product_recruit/services/userlist_services/get_userlist_service.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileUpdateSuccessState extends ProfileState {
  ProfileUpdate msg;
  ProfileUpdateSuccessState({this.msg});
}

class ProfileUpdateFailure extends ProfileState {}

//Events
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}

class ProfileInitialEvent extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  String name, phone, signature;
  UpdateProfile(this.name, this.phone, this.signature);
  List<Object> get props => [name, phone, signature];
}

//bloc

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState());
  UserProfileUpdate updateProfileService = new UserProfileUpdate();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is UpdateProfile) {
      yield* _mapUpdateProfileToState(event);
    }
    if (event is ProfileInitialEvent) {
      yield* _mapUpdateProfileInitialToState(event);
    }
  }

  Stream<ProfileState> _mapUpdateProfileToState(UpdateProfile event) async* {
    try {
      var res = await updateProfileService.userprofileUpdate(
          event.name, event.phone, event.signature);

      print("response of add spam");
      yield ProfileUpdateSuccessState(msg: res);
    } catch (e) {
      yield ProfileUpdateFailure();
    }
  }

  Stream<ProfileState> _mapUpdateProfileInitialToState(
      ProfileInitialEvent event) async* {
    print("Initial state fetch user list");
    try {
      var res = await GetUserListService.getUserList();
    } catch (e) {}
  }
}
