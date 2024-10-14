import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TProfileImage extends StatelessWidget {
  const TProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      top: TSizes.imageCarouselHeight / 1.5,
      child: TCircularImage(
        image: TImages.profile,
        width: 150,
        height: 150,
        backgroundColor: dark ? Colors.black : TColors.white,
      ),
    );
  }
}
