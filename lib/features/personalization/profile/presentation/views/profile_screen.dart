import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/appbar/appbar.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/add_photo_button.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/bio_text.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/cover_image.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/edit_profile_icon_button.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/follower_text_number.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/following_text_number.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/name_text.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/photo_text_number.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/post_text_number.dart';
import 'package:socshea/features/personalization/profile/presentation/views/widgets/profile_image.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/device/device_utility.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const TAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Stack(
              alignment: AlignmentDirectional.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                TCoverImage(),
                TProfileImage()
              ],
            ),
            SizedBox(height: TDeviceUtils.getScreenHeight(context) * 0.1),
            TNameText(name: userModel.username),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TBioText(),
            const SizedBox(height: TSizes.spaceBtwSections),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TPostTextNumber(),
                TPhotoTextNumber(),
                TFollowerTextNumber(),
                TFollowingTextNumber()
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Row(
                children: [
                  Expanded(flex: 5,child: TAddPhotoButton()),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(flex: 1,child: TEditProfileIconButton()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
