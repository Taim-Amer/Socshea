part of 'register_google_cubit.dart';

abstract class RegisterGoogleState {}

class RegisterGoogleInitial extends RegisterGoogleState {}

class RegisterGoogleLoadingState extends RegisterGoogleState {}

class RegisterGoogleSuccessState extends RegisterGoogleState {}

class RegisterGoogleFailureState extends RegisterGoogleState {
  final String error;
  RegisterGoogleFailureState(this.error);
}
