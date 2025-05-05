import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/common/buttons/switch_button.dart';
import '../../../core/common/widgets/containers/rounded_container.dart';
import '../../../core/common/widgets/images/circular_images.dart';
import '../../../core/common/widgets/images/edge_rounded_images.dart';
import '../../../core/common/widgets/list_tiles/settings_menu_tiles.dart';
import '../../../utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TRoundedContainer(
                useContainerGradient: false,
                useGlass: false,
                backgroundColor: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const PCircularImage(
                          imageUrl: PImages.appLogo,
                          height: 50,
                          width: 50,
                          backgroundColor: PColors.transparent,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Deo',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: PSizes.spaceBtwItems / 2),
                            Text(
                              'UID: 878376981923',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // ignore: prefer_const_constructors
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        backgroundColor: isDark ? PColors.light : PColors.dark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: isDark ? PColors.dark : PColors.light,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: PSizes.spaceBtwItems / 2),
              const Divider(
                indent: PSizes.sm,
                endIndent: PSizes.sm,
                thickness: 0.5,
                color: PColors.grey,
              ),
              const SizedBox(height: PSizes.spaceBtwSections),
              // SETTING SECTION
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.apply(fontSizeDelta: -3),
                  ),
                  const SizedBox(height: PSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        const PSettingsMenuTile(
                          icon: Iconsax.user,
                          title: 'My Account',
                        ),
                        const PSettingsMenuTile(
                          icon: Iconsax.location,
                          title: 'Address',
                        ),
                        const PSettingsMenuTile(
                          icon: Icons.help_outline_rounded,
                          title: 'Help Center',
                        ),
                        PSettingsMenuTile(
                          icon: Iconsax.emoji_happy,
                          title: 'Face ID',
                          trailing: SwitchButton(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: PSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.apply(fontSizeDelta: -3),
                  ),
                  const SizedBox(height: PSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        PSettingsMenuTile(
                          icon: Iconsax.notification,
                          title: 'Push notifications',
                          trailing: SwitchButton(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        PSettingsMenuTile(
                          icon: Icons.dark_mode_outlined,
                          title: 'Dark Theme',
                          trailing: SwitchButton(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        const PSettingsMenuTile(
                          icon: Iconsax.logout,
                          title: 'Logout',
                          trailing: SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
