import 'package:flutter/material.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/create_post_widget.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/feed_appbar.dart';
import 'package:socshea/features/social/feeds/presentation/views/widgets/post_widget.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/device/device_utility.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TFeedAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TCreatePostWidget(userModel: userModel),
            const SizedBox(height: TSizes.spaceBtwSections,),
            SizedBox(
              height: TDeviceUtils.getScreenHeight(context),
              child: ListView.separated(
                  itemBuilder: (context, index) => TPostWidget(userImage: userModel.image,),
                  separatorBuilder: (context, _) => const SizedBox(height: TSizes.spaceBtwItems),
                  itemCount: 4,
              ),
            ),
            // const SizedBox(height: TSizes.spaceBtwSections)
          ],
        ),
      ),
    );
  }
}