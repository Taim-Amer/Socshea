import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/signup/presentation/manager/register_cubit/register_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).registerFormKey,
      child: Column(
        children: [
          Row(
            children: [
              //First Name
              Expanded(
                child: TextFormField(
                  controller: RegisterCubit.get(context).firstNameController,
                  validator: (value) => TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputField,),
              //Last Name
              Expanded(
                child: TextFormField(
                  controller: RegisterCubit.get(context).lastNameController,
                  validator: (value) => TValidator.validateEmptyText("Last Name", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Username
          TextFormField(
            controller: RegisterCubit.get(context).usernameController,
            validator: (value) => TValidator.validateEmptyText("Username", value),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Email
          TextFormField(
            controller: RegisterCubit.get(context).emailController,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Phone Number
          TextFormField(
            controller: RegisterCubit.get(context).phoneNumberController,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Password
          TextFormField(
            controller: RegisterCubit.get(context).passwordController,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: RegisterCubit.get(context).hidePassword,
            decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => RegisterCubit.get(context).hidePassword = !RegisterCubit.get(context).hidePassword,
                  icon: Icon(RegisterCubit.get(context).hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                )
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),

          const SizedBox(height: TSizes.spaceBtwSections,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => RegisterCubit.get(context).register(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}