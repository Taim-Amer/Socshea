import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:socshea/common/widgets/texts/sub_title_text.dart";
import "package:socshea/utils/constants/colors.dart";
import "package:socshea/utils/constants/enums.dart";
import "package:socshea/utils/constants/sizes.dart";

class TTextWithVerifiedIcon extends StatelessWidget {
  const TTextWithVerifiedIcon({
    super.key,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.medium,
    required this.title,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes? brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TSubTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            textSize: brandTextSize!,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}
