part of 'register_email_cubit.dart';

class RegisterEmailState extends Equatable{
  const RegisterEmailState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterEmailState {}

class RegisterEmailLoadingState extends RegisterEmailState {}

class RegisterEmailSuccessState extends RegisterEmailState {}

class RegisterEmailFailureState extends RegisterEmailState {
  final String error;
  const RegisterEmailFailureState(this.error);
}
