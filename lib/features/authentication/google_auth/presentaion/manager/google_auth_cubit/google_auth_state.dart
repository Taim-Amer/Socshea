part of 'google_auth_cubit.dart';

class GoogleAuthState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSuccessState extends GoogleAuthState {}

class GoogleAuthFailureState extends GoogleAuthState {
  final String error;
  GoogleAuthFailureState(this.error);
}
