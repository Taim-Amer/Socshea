part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;
  const LoginFailureState(this.error);
}

class HidePasswordState extends LoginState{
  final bool isPassword;
  const HidePasswordState(this.isPassword);
}