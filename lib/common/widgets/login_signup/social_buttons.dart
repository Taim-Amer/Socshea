import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:socshea/features/authentication/google_auth/presentation/manager/google_auth_cubit/google_auth_cubit.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/router/app_router.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
          listener: (context, state){
            if(state is GoogleAuthSuccessState) {
              context.go(TAppRouter.kNavigationMenu, extra : state.userModel);
            }
          },
          builder: (context, state){
            return Container(
              decoration: BoxDecoration(border: Border.all(color: TColors.grey,), borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                onPressed: () => GoogleAuthCubit.get(context).googleAuthentication(context),
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
