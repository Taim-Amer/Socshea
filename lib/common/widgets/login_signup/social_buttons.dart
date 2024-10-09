import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socshea/features/login/presentation/manager/register_google_cubit/register_google_cubit.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<RegisterGoogleCubit, RegisterGoogleState>(
            builder: (context, state){
              return Container(
                decoration: BoxDecoration(border: Border.all(color: TColors.grey,), borderRadius: BorderRadius.circular(100)),
                child: IconButton(
                  onPressed: () => RegisterGoogleCubit.get(context).registerWithGoogle(),
                  icon: const Image(
                    width: TSizes.iconMd,
                    height: TSizes.iconMd,
                    image: AssetImage(TImages.google),
                  ),
                ),
              );
            },
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey,), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: TSizes.iconLg,
              height: TSizes.iconLg,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
