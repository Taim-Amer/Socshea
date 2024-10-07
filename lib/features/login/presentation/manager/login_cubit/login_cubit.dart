import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socshea/features/login/data/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  Future<void> login({required String email, required String password}) async{
    emit(LoginLoadingState());
    var response = await loginRepo.login(email: email, password: password);

    response.fold(
            (failure) => LoginFailureState(failure.errMessage),
            (success) => LoginSuccessState());
  }
}