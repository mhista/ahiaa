import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';

class PSignupHeader extends StatelessWidget {
  const PSignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(width: 70, height: 100, image: AssetImage(PImages.appLogo)),
        // Text(
        //   PTexts.loginTitle,
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        // const SizedBox(height: PSizes.sm),
        // Text(
        //   PTexts.loginSubtitle,
        //   style: Theme.of(context).textTheme.bodyMedium,
        // ),
      ],
    );
  }
}
