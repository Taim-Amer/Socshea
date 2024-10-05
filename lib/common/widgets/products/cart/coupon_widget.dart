import 'package:flutter/material.dart';
import 'package:socshea/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/helpers/helper_functions.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(top: TSizes.sm, right: TSizes.sm, bottom: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code ? Enter here.",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark ? TColors.white.withOpacity(.5) : TColors.dark.withOpacity(.5),
                  backgroundColor: Colors.grey.withOpacity(.2),
                  side: BorderSide(color: Colors.grey.withOpacity(.1))
              ),
              onPressed: (){},
              child: const Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}

