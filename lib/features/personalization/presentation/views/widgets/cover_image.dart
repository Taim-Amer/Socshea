import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/images/rounded_image.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';

class TProfileCoverImage extends StatelessWidget {
  const TProfileCoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TRoundedImage(
      imageUrl: TImages.cover,
      backgroundColor: Colors.transparent,
      applyImageRadius: false,
      height: TSizes.imageCarouselHeight,
      width: double.infinity,
    );
  }
}
