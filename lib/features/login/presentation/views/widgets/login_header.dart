import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
            // height: 180,
            image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
          ),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

