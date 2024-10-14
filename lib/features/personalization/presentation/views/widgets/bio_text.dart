import 'package:flutter/material.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TBioText extends StatelessWidget {
  const TBioText({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: Text("Hey Global I am s Software Engineer .... ", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: dark ? TColors.light : TColors.black)),
    );
  }
}
