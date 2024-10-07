import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/router/app_router.dart';
import 'package:socshea/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Form(
          key: LoginCubit.get(context).loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),
                TextFormField(
                  // validator: FormKeyCubit.get(context).passwordValidator,
                  validator: (value) => TValidator.validatePassword(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: Icon(Iconsax.eye_slash),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: TSizes.spaceBtwInputField / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        const Text(TTexts.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(TTexts.forgetPassword),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => LoginCubit.get(context).login,
                        child: const Text(TTexts.signIn),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => GoRouter.of(context).pushNamed(TAppRouter.kRegisterScreen),
                        child: const Text(TTexts.createAccount),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
