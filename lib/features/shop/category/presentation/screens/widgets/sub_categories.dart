import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/failure/failure_widget.dart';
import '../../../../../../core/common/widgets/shimmer/categories/category_tile_shimmer.dart';
import '../../../../../../core/dependency/init_dependencies.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../bloc/category_bloc.dart';
import 'sub_category_select.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    serviceLocator<CategoryBloc>().add(GetSubCategory(categoryId: 1));

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) return CategoryTileShimmer();
        if (state is CategoryFailure) {
          return FailureWidget();
        } else if (state is CategoriesLoaded) {
          // debugPrint('Subcategories: ${state.categories}');
          if (state.subCategories.isEmpty) {
            return const CategoryTileShimmer();
          }
          final subCategories = state.subCategories;
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: PSizes.spaceBtwItems,
              right: PSizes.spaceBtwItems,
            ),
            // physics: const AlwaysScrollableScrollPhysics(),
            itemCount: subCategories.length,
            itemBuilder: (context, index) {
              final subCategory = subCategories[index];
              return SubCategoryListChild(category: subCategory);
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
