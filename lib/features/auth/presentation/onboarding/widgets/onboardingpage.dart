import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Image(
            width: PHelperFunctions.screenWidth(context),
            height: PHelperFunctions.screenHeight(context),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          Container(
            width: PHelperFunctions.screenWidth(context),
            height: PHelperFunctions.screenHeight(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  PColors.transparent,
                  PColors.transparent,
                  Colors.black.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: PHelperFunctions.screenHeight(context) / 4,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(PSizes.spaceBtwItems),
              child: Column(
                children: [
                  FadeInUp(
                    // delay: Duration(seconds: 1),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge!.apply(
                        fontWeightDelta: 1,
                        color: Colors.white,
                        heightDelta: 0.2,
                        fontSizeDelta: 1,
                        // heightFactor: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: PSizes.spaceBtwItems),
                  FadeInUp(
                    duration: Duration(seconds: 1),
                    child: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontWeightDelta: 1,
                        color: Colors.white,
                        heightDelta: 0.2,
                        fontSizeDelta: 1,
                        // heightFactor: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
