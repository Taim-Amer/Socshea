import 'package:flutter/material.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';

class LinearLoader extends StatelessWidget {
  const LinearLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
      child: Column(
        children: [
          LinearProgressIndicator(color: TColors.primary, backgroundColor: TColors.primary.withOpacity(.3)),
          const SizedBox(height: TSizes.spaceBtwItems,)
        ],
      ),
    );
  }
}
