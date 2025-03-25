import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart'
    show TRoundedContainer;
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ClipButtonButton extends StatelessWidget {
  const ClipButtonButton({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {},

        child: TRoundedContainer(
          elevation: 0.4,
          radius: 20,
          backgroundColor: PColors.secondary,
          height: 32,
          width: 56,
          child: Center(
            child: Text(
              '\$$index',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
