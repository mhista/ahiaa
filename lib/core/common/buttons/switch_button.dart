import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, required this.value, this.onChanged});
  final bool value;
  final Function(bool value)? onChanged;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => onChanged,
      child: Stack(
        children: [
          Container(
            width: 50,
            decoration: BoxDecoration(
              color:
                  value
                      ? PColors.white
                      : isDark
                      ? PColors.darkerGrey
                      : PColors.grey,
              borderRadius: BorderRadius.circular(100),
              gradient: value ? PColors.generalGradient : null,
            ),
            height: 28,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment:
                    value ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    height: value ? 22 : 20,
                    width: value ? 22 : 20,
                    decoration: BoxDecoration(
                      color:
                          value
                              ? isDark
                                  ? PColors.black
                                  : PColors.white
                              : isDark
                              ? PColors.darkGrey
                              : PColors.white,
                      borderRadius: BorderRadius.circular(100),
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
