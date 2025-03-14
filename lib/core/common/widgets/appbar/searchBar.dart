import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/device/device_utility.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';

import '../../../../utils/helpers/helper_functions.dart';

class KSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const KSearchBar({
    super.key,
    this.color,
    required this.hintText,
    this.useSuffix = false,
    this.useBorder = true,
    this.hasColor = false,
    this.isCollapsed = false,
    this.isDense = false,
    this.radius,
    this.suffixWidget,
    this.textController,
    this.usePrefixSuffix = false,
    this.onChanged,
    this.prefixWidget,
    this.focusNode,
    this.onTap,
    this.minLines,
    this.maxLines,
    this.useSearch = false,
    this.childrensColor,
    this.useMargin = false,
    this.margin,
  });

  // to add the background color to tabs, wrap with material widget.
  final Color? color, childrensColor;
  final String hintText;
  final bool useSuffix,
      useBorder,
      hasColor,
      usePrefixSuffix,
      useSearch,
      isCollapsed,
      isDense,
      useMargin;
  final double? radius;
  final Widget? suffixWidget, prefixWidget;
  final TextEditingController? textController;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? minLines, maxLines;
  final EdgeInsetsGeometry? margin;

  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Container(
      margin: !useMargin ? null : margin,
      child: TextFormField(
        // expands: true,
        minLines: minLines,
        maxLines: maxLines,
        onTap: onTap,
        focusNode: focusNode,
        onChanged: onChanged,
        controller: textController,
        style: Theme.of(
          context,
        ).textTheme.labelMedium!.apply(color: childrensColor),
        decoration: InputDecoration(
          constraints: BoxConstraints.expand(),
          isCollapsed: isCollapsed,
          isDense: isDense,
          fillColor:
              hasColor
                  ? color
                  : isDark
                  ? PColors.black
                  : PColors.white,
          filled: true,
          contentPadding:
              useSuffix
                  ? const EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                  : const EdgeInsets.only(top: 15, left: 8, bottom: 10),
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.labelMedium!.apply(color: childrensColor),
          suffixIcon:
              useSuffix || usePrefixSuffix
                  ? suffixWidget ??
                      SearchIcon(isDark: isDark, color: childrensColor)
                  : null,
          prefixIcon:
              !useSearch
                  ? null
                  : !useSuffix
                  ? prefixWidget ??
                      SearchIcon(isDark: isDark, color: childrensColor)
                  : null,
          border: inputBorder(isDark, useBorder, radius),
          focusedBorder: inputBorder(isDark, useBorder, radius),
          enabledBorder: inputBorder(isDark, useBorder, radius),
        ),
      ),
    );
  }

  OutlineInputBorder inputBorder(bool isDark, bool useBorder, double? radius) {
    return OutlineInputBorder(
      borderSide:
          useBorder
              ? BorderSide(
                color:
                    isDark ? PColors.grey.withValues(alpha: 0.2) : PColors.grey,
              )
              : BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 14.0)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key, required this.isDark, this.color});

  final bool isDark;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Icon(
        Iconsax.search_normal_1,
        size: 20,
        color: color,

        // color: Colors.white,
      ),
    );
  }
}
