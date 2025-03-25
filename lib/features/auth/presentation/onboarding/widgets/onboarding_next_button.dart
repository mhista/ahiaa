import 'package:ahiaa/core/cubits/navigation/navigation_cubit.dart';
import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Positioned(
      right: PSizes.defaultSpace,
      bottom: PDeviceUtils.getBottomNavigationHeight(),
      child: ElevatedButton(
        onPressed: () => serviceLocator<OnboardingCubit>().nextPage(context),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: isDark ? PColors.primary : Colors.black,
        ),
        child: const Icon(FontAwesomeIcons.arrowRight),
      ),
    );
  }
}
