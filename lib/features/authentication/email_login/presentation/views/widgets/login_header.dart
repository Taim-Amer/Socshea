import 'package:flutter/material.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image(
                image: AssetImage(dark ? TImages.login : TImages.login),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}

