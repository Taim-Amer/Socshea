import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo.dart';
import 'package:socshea/utils/network/network_manager.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit({required this.googleAuthRepo}) : super(GoogleAuthInitial());

  static GoogleAuthCubit get(context) => BlocProvider.of(context);


  final GoogleAuthRepo googleAuthRepo;

  Future<void> googleAuthentication() async{
    emit(GoogleAuthLoadingState());

    final isConnected = await TNetworkManager.instance.isConnected();
    if(!isConnected) return;


    var response = await googleAuthRepo.googleAuthentication();

    response.fold(
            (failure) => emit(GoogleAuthFailureState(failure.errMessage)),
            (success) => emit(GoogleAuthSuccessState()));
  }
}
