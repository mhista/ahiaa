import 'package:ahiaa/core/common/loaders/loaders.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:ahiaa/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/common/loaders/button_loading.dart';
import '../../../../../core/common/widgets/fields/custom_textfield.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      // key: controller.AuthFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFieldForm(
              controller: emailController,
              fieldName: 'Email',
              labelText: 'Email',
              icon: Iconsax.direct,
              validator: PValidator.validateEmail,
            ),
            const SizedBox(height: PSizes.spaceBtwInputFields),

            //Password
            TextFieldForm(
              controller: passwordController,
              fieldName: 'Password',
              labelText: PTexts.password,
              icon: Iconsax.password_check,
              useSuffixIcon: true,
              suffixIcon: Iconsax.eye_slash,
              // obscureText: true,
            ),

            const SizedBox(height: PSizes.spaceBtwInputFields / 2),
            // Remeber me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remeber me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(PTexts.remember),
                  ],
                ),
                // forget password
                TextButton(
                  onPressed: () {},
                  child: const Text(PTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: PSizes.spaceBtwSections),
            // SignInButton
            SizedBox(
              width: double.infinity,
              child: BlocConsumer<AuthBloc, AuthStateChanges>(
                listener: (context, state) {
                  if (state is AuthFailure) {
                    PLoaders.errorSnackBar(
                      message: state.message,
                      context: context,
                    );
                  }
                  if (state is AuthSuccess) {
                    PLoaders.customToast(
                      message: 'Login success',
                      context: context,
                    );
                    Beamer.of(context).beamToReplacementNamed(RouteNames.home);
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    child:
                        state is AuthLoading
                            ? LoadingAnimator()
                            : Text(PTexts.signIn),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthLogin(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: PSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap:
                      () => Beamer.of(
                        context,
                      ).beamToNamed(RouteNames.signup, stacked: false),
                  child: Text(
                    "Sign Up",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.apply(fontSizeDelta: -3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: PSizes.spaceBtwItems / 2),

            // create account buttons
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(
            //     onPressed: () {},
            //     child: const Text(PTexts.createAccount),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
