import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/authentication/email_login/data/repositories/login_repo.dart';
import 'package:socshea/utils/network/network_manager.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginRepo loginRepo;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool hidePassword = true;

  Future<void> login() async{
    emit(LoginLoadingState());
    final isConnected = await TNetworkManager.instance.isConnected();
    if(!isConnected) return;

    if(!loginFormKey.currentState!.validate()) return;

    var response = await loginRepo.login(email: emailController.text.trim(), password: passwordController.text.trim());
    response.fold(
            (failure) => emit(LoginFailureState(failure.errMessage)),
            (success) => emit(LoginSuccessState()));

  }

  void changePasswordVisibility(){
    hidePassword = !hidePassword;
    emit(HidePasswordState(hidePassword));
  }
}