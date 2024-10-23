// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/authentication/email_login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/router/app_router.dart';
import 'package:socshea/utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: context.read<LoginCubit>().loginFormKey,
            child: Column(
              children: [
                //Headings

                Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
                const SizedBox(height: TSizes.spaceBtwItems,),
                Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
                const SizedBox(height: TSizes.spaceBtwSections * 2,),

                //TextField
                TextFormField(
                  controller: context.read<LoginCubit>().emailController,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
                ),
                const SizedBox(height: TSizes.spaceBtwSections,),

                //Submit button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () => context.read<LoginCubit>().sendPasswordResetEmail().then((value) {
                      context.go(TAppRouter.kResetPasswordScreen);
                    }), child: const Text(TTexts.submit))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
