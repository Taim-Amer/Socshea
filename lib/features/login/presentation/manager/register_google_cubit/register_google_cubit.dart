import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/login/data/repositories/login_repo.dart';
import 'package:socshea/utils/network/network_manager.dart';

part 'register_google_state.dart';

class RegisterGoogleCubit extends Cubit<RegisterGoogleState> {
  RegisterGoogleCubit({required this.registerGoogleRepo}) : super(RegisterGoogleInitial());

  static RegisterGoogleCubit get(context) => BlocProvider.of(context);

  final LoginRepo registerGoogleRepo;

  Future<void> registerWithGoogle() async{
    emit(RegisterGoogleLoadingState());

    final isConnected = await TNetworkManager.instance.isConnected();
    if(!isConnected) return;

    var response = await registerGoogleRepo.registerWithGoogle();
    
    response.fold(
            (failure) => RegisterGoogleFailureState(failure.errMessage),
            (success) => RegisterGoogleSuccessState());
  }
}
