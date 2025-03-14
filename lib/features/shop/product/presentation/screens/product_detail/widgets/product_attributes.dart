import 'package:ahiaa/core/common/widgets/products/cart/add_remove_button.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/utils/constants/colors.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:ahiaa/utils/helpers/helper_functions.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/list_tiles/settings_menu_tiles.dart';
import '../../../../../../../core/common/widgets/list_tiles/variation_tile.dart';
import '../../../../../../../core/common/widgets/texts/product_price_text.dart';
import '../../../../../../../core/common/widgets/texts/product_title_text.dart';
import '../../../../../../../core/common/widgets/texts/section_heading.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  // final ProductModel product;
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(VariationController());
    final isDark = PHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // SELECTED ATTRIBUTE PRICING
        // if (controller.selectedVariation.value.id.isNotEmpty)
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(vertical: PSizes.md),
          child: Column(
            spacing: PSizes.sm,
            children: [
              VariationWithText(
                title: 'Color',
                subtitle: 'Brown',
                onPressed: () {},
              ),
              VariationWithText(
                title: 'Size',
                subtitle: 'Small',
                onPressed: () {},
              ),

              VariationTile(
                title: 'Quantity',
                trailing: GestureDetector(
                  onTap: () {},
                  child: ProductAddAndRemove(
                    width: 30,
                    height: 30,
                    addColor: !isDark ? PColors.black : PColors.white,
                    addBgColor: PColors.transparent,
                    minusColor: !isDark ? PColors.darkGrey : PColors.grey,
                    minusBgColor: PColors.transparent,
                    text: '1',
                    addOnPressed: () {},
                    minusOnPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VariationWithText extends StatelessWidget {
  const VariationWithText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String title, subtitle;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return VariationTile(
      title: title,
      trailing: GestureDetector(
        onTap: onPressed,
        child: Row(
          spacing: PSizes.xs + 2,
          children: [
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(fontWeightDelta: 2),
            ),
            Column(
              children: [
                Icon(Icons.keyboard_arrow_up_outlined, size: 15, weight: 3),
                Icon(Icons.keyboard_arrow_down_outlined, size: 15, weight: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
