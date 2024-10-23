import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/features/authentication/email_register/data/models/user_model.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/device/device_utility.dart';
import 'package:socshea/utils/router/app_router.dart';

class TCreatePostWidget extends StatelessWidget {
  const TCreatePostWidget({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: Row(
        children: [
          TCircularImage(image: userModel.image, padding:0, width: 45, height: 45, isNetworkImage: true),
          const SizedBox(width: TSizes.spaceBtwItems,),
          Expanded(flex: 5, child: GestureDetector(
            onTap: () => context.push(TAppRouter.kCreatePostScreen, extra: userModel),
            child: Container(
              width: TDeviceUtils.getScreenWidth(context),
              padding: const EdgeInsets.all(TSizes.md),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  border: Border.all(color: TColors.grey)
              ),
              child: Text(TTexts.yourMind, style: Theme.of(context).textTheme.bodySmall),
            ),
          )),
        ],
      ),
    );
  }
}
