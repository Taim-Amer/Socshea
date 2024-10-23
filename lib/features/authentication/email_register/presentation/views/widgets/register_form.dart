import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/features/authentication/email_register/presentation/manager/register_cubit/register_email_cubit.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';
import 'package:socshea/utils/validators/validation.dart';

class TRegisterForm extends StatelessWidget {
  const TRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterEmailCubit>().registerFormKey,
      child: Column(
        children: [
          Row(
            children: [
              //First Name
              Expanded(
                child: TextFormField(
                  controller: context.read<RegisterEmailCubit>().firstNameController,
                  validator: (value) => TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputField,),
              //Last Name
              Expanded(
                child: TextFormField(
                  controller: context.read<RegisterEmailCubit>().lastNameController,
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
            controller: context.read<RegisterEmailCubit>().usernameController,
            validator: (value) => TValidator.validateEmptyText("Username", value),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Email
          TextFormField(
            controller: context.read<RegisterEmailCubit>().emailController,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Phone Number
          TextFormField(
            controller: context.read<RegisterEmailCubit>().phoneNumberController,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputField,),
          //Password
          TextFormField(
            controller: context.read<RegisterEmailCubit>().passwordController,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: context.read<RegisterEmailCubit>().hidePassword,
            decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => context.read<RegisterEmailCubit>().hidePassword = !context.read<RegisterEmailCubit>().hidePassword,
                  icon: Icon(context.read<RegisterEmailCubit>().hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                )
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),

          const SizedBox(height: TSizes.spaceBtwSections,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.read<RegisterEmailCubit>().registerWithEmail(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}