import 'package:ahiaa/core/common/loaders/button_loading.dart';
import 'package:ahiaa/core/common/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/common/widgets/fields/custom_textfield.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

import '../../bloc/auth_bloc.dart';
import 'terms_and_conditions_checkbox.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
      child: Column(
        children: [
          // first and last name
          Row(
            children: [
              Expanded(
                child: TextFieldForm(
                    controller: firstNameController,
                    fieldName: 'First Name',
                    labelText: PTexts.firstname,
                    validator: (value) =>
                        PValidator.validateEmptyText('First Name', value),
                    icon: Iconsax.profile),
              ),
              const SizedBox(
                width: PSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFieldForm(
                    controller: lastNameController,
                    fieldName: 'Last Name',
                    labelText: PTexts.lastname,
                    validator: (value) =>
                        PValidator.validateEmptyText('Last Name', value),
                    icon: Iconsax.user),
              ),
            ],
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // // Username
          // TextFieldForm(
          //     controller: userNameController,
          //     fieldName: 'Username',
          //     labelText: PTexts.username,
          //     validator: (value) =>
          //         PValidator.validateEmptyText('Username', value),
          //     icon: Iconsax.user_edit),
          // const SizedBox(
          //   height: PSizes.spaceBtwInputFields,
          // ),
          // Email
          TextFieldForm(
            controller: emailController,
            fieldName: 'Email',
            labelText: 'Email',
            icon: Iconsax.direct,
            validator: PValidator.validateEmail,
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // PhoneNumber
          TextFieldForm(
              controller: phoneController,
              fieldName: 'Phone number',
              labelText: PTexts.phoneNumber,
              icon: Iconsax.call),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // Password
          TextFieldForm(
            controller: passwordController,
            fieldName: 'Password',
            labelText: PTexts.password,
            icon: Iconsax.password_check,
            useSuffixIcon: true,
            suffixIcon: Iconsax.eye_slash,
            // obscureText: true,
          ),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          // Terms and condition
          const PTermsAndConditions(),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child:
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthFailure) {
                PLoaders.customToast(message: state.message, context: context);
              }
            }, builder: (context, state) {
              return ElevatedButton(
                  child: state is AuthLoading
                      ? LoadingAnimator()
                      : Text(PTexts.createAccount),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthSignUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                          ),
                        );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
