import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../loaders/loaders.dart';

class PSocialButton extends StatelessWidget {
  const PSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: PColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () async {
              await serviceLocator<SupabaseClient>().auth.signOut();
            },
            icon: const Image(
              image: AssetImage(PImages.facebook),
              height: PSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: PSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: PColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: BlocConsumer<AuthBloc, AuthStateChanges>(
            listener: (context, state) {
              if (state is AuthFailure) {
                PLoaders.customToast(message: state.message, context: context);
              }

              if (state is AuthSuccess) {
                PLoaders.customToast(
                  message: 'Account Created, verify to enjoy full benefit',
                  context: context,
                );
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed:
                    () => context.read<AuthBloc>().add(GoogleSigninEvent()),
                icon: const Image(
                  image: AssetImage(PImages.google),
                  height: PSizes.iconMd,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
