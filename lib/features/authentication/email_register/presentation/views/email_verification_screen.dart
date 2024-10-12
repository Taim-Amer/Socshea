// ignore_for_file: use_build_context_synchronously

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:socshea/features/authentication/email_register/presentation/manager/register_cubit/register_email_cubit.dart";
import "package:socshea/utils/constants/image_strings.dart";
import "package:socshea/utils/constants/sizes.dart";
import "package:socshea/utils/constants/text_strings.dart";
import "package:socshea/utils/helpers/helper_functions.dart";
import "package:socshea/utils/router/app_router.dart";

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => RegisterEmailCubit.get(context).signOut(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth(context)),
              const SizedBox(height: TSizes.spaceBtwSections),

              //title and subTitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(email ?? "", style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              //buttons
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: () async {
                    await RegisterEmailCubit.get(context).checkEmailVerification().then((isVerified) {
                      if (isVerified) {
                        context.go(TAppRouter.kEmailVerificationSuccessScreen);
                      }
                    });
                  },
                child: const Text(TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems,),

              SizedBox(width: double.infinity, child: TextButton(
                onPressed: () => RegisterEmailCubit.get(context).sendEmailVerification(),
                child: const Text(TTexts.resendEmail),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
