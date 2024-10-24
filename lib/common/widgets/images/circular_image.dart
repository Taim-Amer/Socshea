import 'dart:io';
import 'package:flutter/material.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.fit = BoxFit.cover,
    this.overlayColor,
    this.backgroundColor,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    required this.image,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    ImageProvider imageProvider;
    if (isNetworkImage) {
      imageProvider = NetworkImage(image);
    } else if (File(image).existsSync()) {
      imageProvider = FileImage(File(image));
    } else {
      imageProvider = AssetImage(image);
    }

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? TColors.black : TColors.white),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image(
          width: width - 2 * padding,
          height: height - 2 * padding,
          fit: fit,
          image: imageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
