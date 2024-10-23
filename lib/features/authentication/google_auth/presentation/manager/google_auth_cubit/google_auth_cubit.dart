import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/common/widgets/loaders/animation_loader.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/authentication/google_auth/data/repositories/google_auth_repo.dart';
import 'package:socshea/utils/network/network_manager.dart';
import 'package:flutter/material.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit({required this.googleAuthRepo}) : super(GoogleAuthInitial());

  final GoogleAuthRepo googleAuthRepo;

  Future<void> googleAuthentication(BuildContext context) async {
    final isConnected = await TNetworkManager.instance.isConnected();
    if (!isConnected) return ;

    final accountSelectionResult = await googleAuthRepo.selectGoogleAccount();

    accountSelectionResult.fold(
          (failure) => emit(GoogleAuthFailureState(failure.errMessage)),
          (googleUser) async {
            TAnimationLoaderWidget.showLoaderDialog(
              context,
              text: "",
              animation: 'assets/animations/Animation - 1728947928594.json',
            );
            emit(GoogleAuthLoadingState());

            final authenticationResult = await googleAuthRepo.authenticateWithGoogle(googleUser);

            authenticationResult.fold(
                  (failure) => emit(GoogleAuthFailureState(failure.errMessage)),
                  (success) => emit(GoogleAuthSuccessState(success)),
            );
      },
    );
  }
}
