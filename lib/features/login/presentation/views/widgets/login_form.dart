import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key,});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputField,),

            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputField / 2,),

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
                    child: const Text(TTexts.forgetPassword)),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: const Text(TTexts.signIn),
                ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    // onPressed: () => Get.to(() => const SignupScreen()),
                    onPressed: () {},
                    child: const Text(TTexts.createAccount),
                ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),
          ],
        ),
      ),
    );
  }
}