import 'package:ahiaa/core/common/widgets/texts/section_heading.dart';
import 'package:ahiaa/features/shop/home/presentation/screens/widgets/home_categories.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/appbar/app_bar.dart';
import '../../../../../utils/constants/sizes.dart';
import 'widgets/sub_categories.dart';

class CategoryAndSubCategorySelect extends StatelessWidget {
  const CategoryAndSubCategorySelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: const Text('Category and Subcategories'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: PSizes.spaceBtwItems,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Categories
          Padding(
            padding: const EdgeInsets.only(left: PSizes.spaceBtwItems),
            child: PHomeCategories(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: PSizes.spaceBtwItems),
            child: PSectionHeading(
              title: 'Subcategories',
              showActionButton: false,
            ),
          ),

          // SUB-CATEGORIES
          Expanded(child: SubCategoryWidget()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Beamer.of(context).beamBack(),
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
