import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/list_tiles/search_list_tile.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class SearchWidgets extends StatelessWidget {
  const SearchWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PSizes.spaceBtwItems),
      child: Column(
        spacing: PSizes.spaceBtwItems / 1.2,
        children: [
          SearchWidgetListTile(),
          SearchWidgetListTile(),
          SearchWidgetListTile(),
        ],
      ),
    );
  }
}
