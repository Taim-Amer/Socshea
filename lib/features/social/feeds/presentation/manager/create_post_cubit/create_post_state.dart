part of 'create_post_cubit.dart';

@immutable
class CreatePostState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoadingState extends CreatePostState {}

class CreatePostSuccessState extends CreatePostState {
  final NewPostModel newPostModel;
  CreatePostSuccessState(this.newPostModel);
}

class CreatePostFailureState extends CreatePostState {
  final String error;
  CreatePostFailureState(this.error);
}
