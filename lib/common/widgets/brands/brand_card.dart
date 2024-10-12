import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/common/widgets/texts/text_with_verified_icon.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/enums.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard ({super.key, required this.showBorder, this.onTap});

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                image: TImages.animalIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor:  dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TTextWithVerifiedIcon(title: "Nike", brandTextSize: TextSizes.large),
                  Text(
                    "256 products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
