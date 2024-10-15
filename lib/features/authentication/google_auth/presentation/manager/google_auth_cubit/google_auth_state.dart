part of 'google_auth_cubit.dart';

class GoogleAuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSuccessState extends GoogleAuthState {
  final UserModel userModel;
  GoogleAuthSuccessState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class GoogleAuthFailureState extends GoogleAuthState {
  final String error;
  GoogleAuthFailureState(this.error);
}
