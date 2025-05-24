import 'package:ahiaa/core/cubits/navigation/navigation_cubit.dart';
import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: PDeviceUtils.getAppBarHeight(),
      right: PSizes.defaultSpace / 1.3,
      child: TextButton(
        onPressed: () => serviceLocator<OnboardingCubit>().skipPage(),
        child: Text(
          'Skip',
          style: Theme.of(context).textTheme.titleLarge!.apply(
            letterSpacingDelta: 0.6,
            fontSizeDelta: 1,
          ),
        ),
      ),
    );
  }
}
