import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/social/feeds/data/models/new_post_model.dart';
import 'package:socshea/features/social/feeds/data/repositories/feeds_repo.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/network/network_manager.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit({required this.feedsRepo, required this.userModel}) : super(CreatePostInitial());

  final FeedsRepo feedsRepo;
  final postTextController = TextEditingController();
  final UserModel userModel;

  Future<void> createPost() async{
    emit(CreatePostLoadingState());
    final isConnected = await TNetworkManager.instance.isConnected();
    if(!isConnected) return;

    var response = await feedsRepo.createNewPost(postTextController.text.trim(), TImages.promoBanner4, uID: userModel.uID, name: userModel.username, image: userModel.image, dateTime: DateTime.now().toString());


    response.fold(
        (failure) => emit(CreatePostFailureState(failure.message)),
        (success) => emit(CreatePostSuccessState(success)),
    );
  }
}
