import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/common/widgets/texts/text_with_verified_icon.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/create_post_appbar.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/create_post_text_field.dart';
import 'package:socshea/utils/constants/sizes.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TCreatePostAppbar(),
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
              const TCreatePostTextField(),
            ],
          ),
        ),
      ),
    );
  }
}