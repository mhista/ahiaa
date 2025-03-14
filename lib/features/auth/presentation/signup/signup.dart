import 'package:flutter/material.dart';
import 'package:ahiaa/core/common/widgets/signup_login/form_divider.dart';
import 'package:ahiaa/core/common/widgets/signup_login/social_button.dart';
import 'package:ahiaa/utils/constants/text_strings.dart';

import '../../../../utils/constants/sizes.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            PSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                PTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // Form
              const PSignupForm(),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              PFormeDivider(dividerText: PTexts.orSignUpWith),
              const SizedBox(
                height: PSizes.spaceBtwSections,
              ),
              // const PSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
