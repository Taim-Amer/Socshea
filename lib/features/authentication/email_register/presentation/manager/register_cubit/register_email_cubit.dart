import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/authentication/email_register/data/repositories/register_repo.dart';
import 'package:socshea/utils/network/network_manager.dart';

part 'register_email_state.dart';

class RegisterEmailCubit extends Cubit<RegisterEmailState> {
  RegisterEmailCubit({required this.registerRepo}) : super(RegisterInitial());

  static RegisterEmailCubit get(context) => BlocProvider.of(context);
  
  final RegisterRepo registerRepo;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool hidePassword = true;
  bool isVerified = false;

  Future<void> registerWithEmail() async{
    emit(RegisterEmailLoadingState());

    final isConnected = await TNetworkManager.instance.isConnected();
    if(!isConnected) return;

    if(!registerFormKey.currentState!.validate()) return;

    var response = await registerRepo.registerWithEmail(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      username: usernameController.text.trim(),
      phone: phoneNumberController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim());

    response.fold(
            (failure) => emit(RegisterEmailFailureState(failure.errMessage)),
            (success) => emit(RegisterEmailSuccessState()));

  }

  Future<void> sendEmailVerification() async{
    await registerRepo.sendEmailVerification();
  }

  Future<bool> checkEmailVerification() async{
    var response = await registerRepo.checkEmailVerification();
    if(response == true){
      isVerified = true;
    }
    return isVerified;
  }
}
