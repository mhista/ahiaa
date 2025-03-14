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
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: PHelperFunctions.isDarkMode(context)
                  ? PColors.darkerGrey.withOpacity(0.9)
                  : PColors.grey.withOpacity(0.9)),
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  // static warningSnackBar({required title, message = ''}) {
  //   SnackBar(title, message,
  //       isDismissible: true,
  //       shouldIconPulse: true,
  //       colorText: PColors.white,
  //       backgroundColor: PColors.warning,
  //       snackPosition: SnackPosition.TOP,
  //       duration: const Duration(seconds: 3),
  //       margin: const EdgeInsets.all(20),
  //       icon: const Icon(
  //         Iconsax.copy_success,
  //         color: PColors.white,
  //       ));
  // }

  // static successSnackBar({required title, message = '', duration = 3}) {
  //   Get.snackbar(title, message,
  //       isDismissible: true,
  //       shouldIconPulse: true,
  //       colorText: PColors.white,
  //       backgroundColor: PColors.info,
  //       snackPosition: SnackPosition.TOP,
  //       duration: Duration(seconds: duration),
  //       margin: const EdgeInsets.all(10),
  //       icon: const Icon(
  //         Iconsax.check,
  //         color: PColors.white,
  //       ));
  // }

  static errorSnackBar(
      {title = 'Oops!',
      message = '',
      duration = 3,
      required BuildContext context}) {
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
