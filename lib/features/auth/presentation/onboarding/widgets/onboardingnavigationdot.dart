import 'package:ahiaa/core/cubits/navigation/navigation_cubit.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: PDeviceUtils.getBottomNavigationHeight() + 25,
      left: PSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: serviceLocator<OnboardingCubit>().pageController,
        count: 3,
        onDotClicked: serviceLocator<OnboardingCubit>().dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: isDark ? PColors.white : PColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
