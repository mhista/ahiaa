import 'package:ahiaa/core/common/widgets/products/product_cards/product_card_vertical.dart'
    show PProductCardVertical;
import 'package:ahiaa/core/common/widgets/shimmer/product_vertical_shimmer.dart';
import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/shop/product/business_logic/bloc/product_bloc.dart';
import 'package:ahiaa/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../utils/constants/sizes.dart';

class StaggeredProductLayout extends StatelessWidget {
  const StaggeredProductLayout({
    super.key,
    this.itemCount,
    this.mainAxisExtent = 260,
    // required this.itemBuilder,
    this.vAxisSpacing,
    this.hAxisSpacing,
    this.physics,
    this.controller,
    this.type = ProductListTypes.normal,
  });
  final int? itemCount;
  final ProductListTypes type;
  final double? mainAxisExtent, vAxisSpacing, hAxisSpacing;
  // final Widget? Function(BuildContext, int) itemBuilder;
  final ScrollPhysics? physics;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final bloc = serviceLocator<ProductBloc>();
    bloc.add(AllProductsGet());
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return VerticalProductShimmer();
        }
        if (state is ProductsGetSuccess) {
          List products = [];

          switch (type) {
            case ProductListTypes.featured:
              products = state.featuredProducts;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );
            case ProductListTypes.brand:
              products = state.brandProducts;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );

            case ProductListTypes.recommended:
              products = state.recommendedProducts;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );

            case ProductListTypes.store:
              products = state.storeProducts;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );

            case ProductListTypes.category:
              products = state.categoryProducts;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );

            case ProductListTypes.fav:
              products = state.favProducts;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );

            default:
              products = state.products;
              return ProductListBuilder(
                controller: controller,
                vAxisSpacing: vAxisSpacing,
                hAxisSpacing: hAxisSpacing,
                physics: physics,
                products: products,
              );
          }
        }
        return SizedBox.shrink();
      },
    );
  }
}

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
    required this.controller,
    required this.vAxisSpacing,
    required this.hAxisSpacing,
    required this.physics,
    required this.products,
  });

  final ScrollController? controller;
  final double? vAxisSpacing;
  final double? hAxisSpacing;
  final ScrollPhysics? physics;
  final List products;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: products.length,
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
        return PProductCardVertical(index: index, product: products[index]);
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
