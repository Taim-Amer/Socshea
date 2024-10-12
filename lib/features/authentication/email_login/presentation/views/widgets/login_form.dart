import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/authentication/email_login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/router/app_router.dart';
import 'package:socshea/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LoginCubit.get(context).loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: LoginCubit.get(context).emailController,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputField),
            TextFormField(
              controller: LoginCubit.get(context).passwordController,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: LoginCubit.get(context).hidePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => LoginCubit.get(context).hidePassword = !LoginCubit.get(context).hidePassword,
                  icon: Icon(LoginCubit.get(context).hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
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
                  onPressed: () => context.push(TAppRouter.kForgetPasswordScreen),
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
                    onPressed: () => LoginCubit.get(context).login(),
                    child: const Text(TTexts.signIn),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.push(TAppRouter.kRegisterScreen),
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
}
