import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:socshea/common/widgets/icons/circular_icon.dart';
import 'package:socshea/common/widgets/images/rounded_image.dart';
import 'package:socshea/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:socshea/common/widgets/texts/product_price_text.dart';
import 'package:socshea/common/widgets/texts/product_title_text.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(height: 120, width: 120, child: TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true)),
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red, width: 40, height: 40),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 172,
            child: Column(
              children: [
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TProductTitleText(title: "Green Nike Half Sleeve Shirt", smallSize: true),
                          SizedBox(height: TSizes.spaceBtwItems / 1),
                          TBrandTitleWithVerifiedIcon(title: "Nike"),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(child: TProductPriceText(price: "256.0")),
                    Container(
                      decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius)
                          )
                      ),
                      child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: TColors.white,))),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
