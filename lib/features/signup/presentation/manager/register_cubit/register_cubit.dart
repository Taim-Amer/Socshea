import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/register/data/repositories/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  // RegisterCubit({required this.registerRepo}) : super(RegisterInitial());
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  
  final RegisterRepo registerRepo;
  
  Future<void> register({required String email, required String password}) async{
    emit(RegisterLoadingState());
    var response = await registerRepo.register(email: email, password: password);

    response.fold(
            (failure) => RegisterFailureState(failure.errMessage),
            (success) => RegisterSuccessState());
  }
}
