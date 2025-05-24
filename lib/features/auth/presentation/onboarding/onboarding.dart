import 'package:ahiaa/core/cubits/navigation/navigation_cubit.dart';
import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboardingnavigationdot.dart' show OnBoardingDotNavigation;
import 'widgets/onboardingpage.dart';
import 'widgets/onboardingskip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable pages
          PageView(
            controller: serviceLocator<OnboardingCubit>().pageController,
            onPageChanged:
                serviceLocator<OnboardingCubit>().updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: PImages.onBoardingImage1,
                subtitle: PTexts.onBoardingSubTitle1,
                title: PTexts.onBoardingTitle1,
              ),
              OnBoardingPage(
                image: PImages.onBoardingImage2,
                subtitle: PTexts.onBoardingSubTitle2,
                title: PTexts.onBoardingTitle2,
              ),
              OnBoardingPage(
                image: PImages.onBoardingImage3,
                subtitle: PTexts.onBoardingSubTitle3,
                title: PTexts.onBoardingTitle3,
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
