import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../utils/constants/colors.dart';

class PLoaders {
  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
  static customToast({required message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:
                PHelperFunctions.isDarkMode(context)
                    ? PColors.darkerGrey.withValues(alpha: 0.9)
                    : PColors.grey.withValues(alpha: 0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }

  static warningSnackBar({
    required title,
    message = '',
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:
                PHelperFunctions.isDarkMode(context)
                    ? PColors.error.withValues(alpha: 0.9)
                    : PColors.error.withValues(alpha: 0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }

  static successSnackBar({
    required title,
    message = '',
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color:
                PHelperFunctions.isDarkMode(context)
                    ? PColors.info.withValues(alpha: 0.9)
                    : PColors.info.withValues(alpha: 0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }

  static errorSnackBar({
    title = 'Oops!',
    message = '',
    duration = 3,
    required BuildContext context,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      AwesomeSnackbarContent(
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
        messageTextStyle: Theme.of(context).textTheme.bodySmall,

        title: title,
        message: message,
        contentType: ContentType.failure,
        // inMaterialBanner: true,
      ),
    );
  }
}
