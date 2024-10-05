import "package:flutter/material.dart";
import "package:socshea/common/widgets/brands/brand_card.dart";
import "package:socshea/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:socshea/utils/constants/colors.dart";
import "package:socshea/utils/constants/image_strings.dart";
import "package:socshea/utils/constants/sizes.dart";
import "package:socshea/utils/helpers/helper_functions.dart";

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, BuildContext context){
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
      child: const Image(fit: BoxFit.contain, image: AssetImage(TImages.productImage1),),
    ),
  );
}