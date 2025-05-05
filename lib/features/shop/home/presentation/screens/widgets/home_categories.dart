import 'package:ahiaa/features/shop/category/presentation/bloc/category_bloc.dart';
import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/images/image_text_widgets/vertical_image_text.dart';
import '../../../../../../core/common/widgets/shimmer/category_shimmer.dart';
import '../../../../../../utils/constants/colors.dart';

class PHomeCategories extends StatelessWidget {
  const PHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    // final categoryController = Get.put(CategoryController());

    // if (categoryController.isLoading.value) return const CategoryShimmer();
    // if (categoryController.featuredCategories.isEmpty) {
    //   return Center(
    //     child: Text(
    //       'No Data Found!',
    //       style: Theme.of(context)
    //           .textTheme
    //           .bodyMedium!
    //           .apply(color: Colors.white, overflow: TextOverflow.ellipsis),
    //     ),
    //   );
    // } else {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) return const CategoryShimmer();
        if (state is CategoryFailure) {
          return Center(
            child: Text(
              'No Data Found!',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        } else if (state is ParentCategoriesFetched) {
          final categories = state.categories;
          return SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                debugPrint(category.image);
                // final category = categoryController.featuredCategories[index];
                return PVerticalImageText(
                  // overlayColor: isDark ? PColors.white : PColors.dark,
                  image: category.image,
                  fit: BoxFit.cover,
                  isNetworkImage: true,
                  title: category.name,
                  textColor: PColors.black,
                  onTap: () {},
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
