import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../containers/rounded_container.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key, required this.isSelected});

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Agro Produce',
          style: Theme.of(context).textTheme.labelMedium!.apply(
            // color:
            //     isSelected
            //         ? PColors.light
            //         : PColors.light.withValues(alpha: 0.8),
            fontSizeDelta: 2,
            fontWeightDelta: 0,
          ),
        ),
        SizedBox(height: 2),
        if (isSelected) TRoundedContainer(width: 35, height: 2),
      ],
    );
  }
}
