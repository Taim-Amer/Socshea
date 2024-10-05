import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text("Coding with Taim", style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text("taim.amer.000@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
