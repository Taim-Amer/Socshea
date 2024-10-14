import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/utils/constants/sizes.dart';

class TEditProfileIconButton extends StatelessWidget {
  const TEditProfileIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: (){}, child: const Icon(Iconsax.edit, size: TSizes.iconSm));
  }
}
