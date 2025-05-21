import 'package:ahiaa/core/dependency/init_dependencies.dart';
import 'package:ahiaa/features/shop/category/domain/entities/category.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/sub_categories.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import 'package:ahiaa/core/common/widgets/appbar/searchBar.dart';
import 'package:ahiaa/core/common/widgets/containers/rounded_container.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import 'sub_cat_checkbox.dart';

class SubCategoryListChild extends StatelessWidget {
  const SubCategoryListChild({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: PSizes.spaceBtwItems / 2,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IMAGE AND DESCRIPTION
            Row(
              spacing: PSizes.spaceBtwItems / 2,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: PSizes.xs - 2,
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(fontWeightDelta: -2),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      spacing: PSizes.xs,
                      children: [
                        TRoundedContainer(
                          height: 7,
                          width: 7,
                          backgroundColor: PColors.secondary,
                        ),
                        Text(
                          '${category.productCounts.toString()}+ collection',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.apply(fontWeightDelta: -1),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SubcatCheckbox(subCategory: category),
          ],
        ),
        Divider(thickness: 0.3, color: PColors.accent.withValues(alpha: 0.3)),
      ],
    );
  }
}
