import 'package:flutter/cupertino.dart';
import 'package:socshea/utils/constants/colors.dart';

class TShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}