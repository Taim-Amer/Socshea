import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/common/widgets/appbar/appbar.dart';
import 'package:socshea/common/widgets/images/rounded_image.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/device/device_utility.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TFeedAppbar extends StatelessWidget implements PreferredSizeWidget{
  const TFeedAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TAppBar(
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.message)),
        TRoundedImage(imageUrl: dark ? TImages.appLogo : TImages.appLogo, backgroundColor: Colors.transparent, height: TDeviceUtils.getAppBarHeight() / 1.8)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
