import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/images/rounded_image.dart';
import 'package:socshea/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:socshea/common/widgets/texts/product_title_text.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TItemCart extends StatelessWidget {
  const TItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TBrandTitleWithVerifiedIcon(title: "Nike"),
            const Flexible(child: TProductTitleText(title: "Black Sport Shoes", maxLines: 1)),

            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: "Color", style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: "Green", style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: "Size", style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: "UK 08", style: Theme.of(context).textTheme.bodyLarge),
                    ]
                )
            )
          ],
        ),
      ],
    );
  }
}
