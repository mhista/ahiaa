import 'package:ahiaa/features/shop/category/presentation/bloc/category_bloc.dart';
import 'package:ahiaa/features/shop/product/business_logic/cubits/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/failure/failure_widget.dart';
import '../../../../../../core/common/widgets/images/image_text_widgets/vertical_image_text.dart';
import '../../../../../../core/common/widgets/shimmer/categories/category_shimmer.dart';
import '../../../../../../core/dependencies/init_dependencies.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../category/services/category_services.dart'
    show CategoryService;

class PHomeCategories extends StatelessWidget {
  const PHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = serviceLocator<CategoryBloc>();
    bloc.add(GetAllParentCategories());
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading &&
            serviceLocator<CategoryService>().parentCategories.isEmpty) {
          return const CategoryShimmer();
        }
        if (state is CategoryFailure) {
          return FailureWidget();
        } else if (state is CategoriesLoaded ||
            serviceLocator<CategoryService>().parentCategories.isNotEmpty) {
          final categories = serviceLocator<CategoryService>().parentCategories;
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
                  onTap: () {
                    serviceLocator<CategoryBloc>().add(
                      GetSubCategory(categoryId: category.id),
                    );
                  },
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
