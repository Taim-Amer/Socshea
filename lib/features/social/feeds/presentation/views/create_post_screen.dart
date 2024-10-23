import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/common/widgets/appbar/appbar.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/common/widgets/texts/text_with_verified_icon.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/social/feeds/presentation/manager/create_post_cubit/create_post_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: const Text("Create Post"), actions: [TextButton(onPressed: () => context.read<CreatePostCubit>().createPost(context), child: const Text("Post"))], showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TCircularImage(image: userModel.image, padding:0, width: 45, height: 45, isNetworkImage: true),
                  const SizedBox(width: TSizes.spaceBtwItems,),
                  TTextWithVerifiedIcon(title: userModel.username),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputField,),
              TextFormField(
                controller: context.read<CreatePostCubit>().postTextController,
                decoration: const InputDecoration(
                  labelText: TTexts.yourMind,
                  labelStyle: TextStyle(
                    fontSize: 25,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}