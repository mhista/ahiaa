import 'dart:developer';

import 'package:ahiaa/core/routes/route_names.dart';
import 'package:ahiaa/features/shop/category/services/category_services.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/sub_categories.dart';
import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/containers/rounded_container.dart';
import '../../../../../../../core/common/widgets/images/circular_images.dart';
import '../../../../../../../core/common/widgets/texts/section_heading.dart';
import '../../../../../../../core/dependency/init_dependencies.dart';
import '../../../../../../../utils/constants/colors.dart';

class CategoryAndSubSelect extends StatelessWidget {
  const CategoryAndSubSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final category = serviceLocator<CategoryService>().parentCategories
        .firstWhere(
          (element) =>
              element.id == serviceLocator<SubCategoryCheckboxCubit>().state,
        );
    return Column(
      spacing: PSizes.spaceBtwItems,

      children: [
        PSectionHeading(title: 'Categorization', showActionButton: false),

        TRoundedContainer(
          onClick: () {
            Beamer.of(context).beamToNamed(RouteNames.categorySelect);
            // Commented code removed for cleanliness
          },
          showBorder: true,
          padding: EdgeInsets.symmetric(
            vertical: PSizes.sm,
            horizontal: PSizes.md,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  spacing: PSizes.spaceBtwItems / 2,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PCircularImage(
                      imageUrl: category.image,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fitWidth,
                      isNetworkImage: true,
                    ),
                    SizedBox(width: PSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Text(
                        category.name,
                        style: Theme.of(context).textTheme.titleMedium!.apply(
                          fontWeightDelta: -1,
                          color: PColors.accent.withValues(alpha: 0.9),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: PSizes.spaceBtwItems / 2),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Edit',
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontWeightDelta: -1,
                      color: PColors.accent.withValues(alpha: 0.9),
                    ),
                  ),
                  SizedBox(width: PSizes.spaceBtwItems / 2),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: PColors.accent.withValues(alpha: 0.9),
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ),

        TRoundedContainer(
          showBorder: true,
          padding: EdgeInsets.all(PSizes.spaceBtwSections),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: PSizes.spaceBtwItems / 2,

                children: [
                  Text(
                    '${serviceLocator<ProductSubCategoryCubit>().state.length.toString()} Subcategories selected',
                    style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontWeightDelta: -1,
                      color: PColors.accent.withValues(alpha: 0.9),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              // Row(
              //   spacing: PSizes.spaceBtwItems / 2,

              //   children: [
              //     Icon(
              //       Icons.arrow_forward_ios_outlined,
              //       color: PColors.accent.withValues(alpha: 0.9),
              //       size: 20,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
