import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/signup/data/repositories/register_repo.dart';
import 'package:socshea/utils/network/network_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  
  final RegisterRepo registerRepo;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Future<void> register() async{
    final isConnected = await TNetworkManager.instance.isConnected();
    if(isConnected) return;

    if(!registerFormKey.currentState!.validate()) return;

    emit(RegisterLoadingState());
    var response = await registerRepo.register(email: emailController.text.trim(), password: passwordController.text.trim());

    response.fold(
            (failure) => RegisterFailureState(failure.errMessage),
            (success) => RegisterSuccessState());

  }
}
