import 'package:ahiaa/core/common/widgets/products/product_cards/product_card_vertical.dart'
    show PProductCardVertical;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../utils/constants/sizes.dart';

class StaggeredProductLayout extends StatelessWidget {
  const StaggeredProductLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 260,
    // required this.itemBuilder,
    this.vAxisSpacing,
    this.hAxisSpacing,
    this.physics,
    this.controller,
  });
  final int itemCount;
  final double? mainAxisExtent, vAxisSpacing, hAxisSpacing;
  // final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollPhysics? physics;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: itemCount,
      controller: controller,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      mainAxisSpacing: vAxisSpacing ?? PSizes.gridViewSpacing,
      crossAxisSpacing: hAxisSpacing ?? PSizes.gridViewSpacing,

      // mainAxisExtent: null,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return PProductCardVertical(index: index);
      },
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../../../utils/constants/sizes.dart';

// class GridLayout extends StatelessWidget {
//   const GridLayout({
//     super.key,
//     required this.itemCount,
//     this.mainAxisExtent = 275,
//     required this.itemBuilder,
//     this.vAxisSpacing,
//     this.hAxisSpacing,
//     this.physics,
//     this.controller,
//   });
//   final int itemCount;
//   final double? mainAxisExtent, vAxisSpacing, hAxisSpacing;
//   final Widget? Function(BuildContext, int) itemBuilder;
//   final ScrollPhysics? physics;
//   final ScrollController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: itemCount,
//       controller: controller,
//       shrinkWrap: true,
//       padding: EdgeInsets.zero,
//       physics: physics ?? const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: vAxisSpacing ?? PSizes.gridViewSpacing,
//         crossAxisSpacing: hAxisSpacing ?? PSizes.gridViewSpacing,

//         mainAxisExtent: mainAxisExtent,
//       ),
//       itemBuilder: itemBuilder,
//     );
//   }
// }
