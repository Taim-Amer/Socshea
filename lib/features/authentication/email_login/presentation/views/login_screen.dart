import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socshea/common/styles/spacing_styles.dart';
import 'package:socshea/common/widgets/login_signup/form_divider.dart';
import 'package:socshea/common/widgets/login_signup/social_buttons.dart';
import 'package:socshea/features/authentication/email_login/presentation/views/widgets/login_form.dart';
import 'package:socshea/features/authentication/email_login/presentation/views/widgets/login_header.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Header
              const TLoginHeader(),

              //Form
              const TLoginForm(),

              //Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: const Text("Navigation Menu")),
              ),

              const SizedBox(height: TSizes.spaceBtwSections,),

              //Footer
              const TSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}
