import 'package:ahiaa/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/images/image_text_widgets/vertical_image_text.dart';
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
    return SizedBox(
      height: 90,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          // final category = categoryController.featuredCategories[index];
          return PVerticalImageText(
            // overlayColor: isDark ? PColors.white : PColors.dark,
            image: PImages.p1,
            fit: BoxFit.cover,
            isNetworkImage: false,
            title: 'Lamp',
            textColor: PColors.black,
            onTap: () {},
          );
        },
      ),
    );
  }
}
