import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

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

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc() : super(ProfileInitialState());


  
  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
   
    if(event is UpdateProfile){
           yield* _mapUpdateProfileToState(event);

    }
  }

  Stream<ProfileState>_mapUpdateProfileToState(ProfileEvent event){
    try {
      
      
    } catch (e) {
    }

  }
  
}