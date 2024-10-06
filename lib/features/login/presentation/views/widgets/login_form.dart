import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/login/presentation/manager/form_key_cubit/form_key_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormKeyCubit(),
      child: Builder(builder: (context) {
        final formKeyCubit = context.read<FormKeyCubit>();

        return Form(
          key: formKeyCubit.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  validator: formKeyCubit.emailValidator,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                  onChanged: formKeyCubit.onEmailChanged,
                ),
                const SizedBox(height: TSizes.spaceBtwInputField),

                TextFormField(
                  validator: formKeyCubit.passwordValidator,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: Icon(Iconsax.eye_slash),
                  ),
                  onChanged: formKeyCubit.onPasswordChanged,
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
                        onPressed: () {
                          formKeyCubit.validateForm();
                        },
                        child: const Text(TTexts.signIn),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        // onPressed: () => Get.to(() => const SignupScreen()),
                        onPressed: () {},
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
      }),
    );
  }
}
