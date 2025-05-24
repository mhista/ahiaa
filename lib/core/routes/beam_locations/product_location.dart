import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/product_detail.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_review/product_reviews.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../../entities/product.dart';

class ProductDetailLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final uri = state.routeInformation.uri;
    final pathSegments = uri.pathSegments;

    final pages = <BeamPage>[];
    debugPrint(state.routeState.toString());

    final product = state.routeState as Products;

    if (pathSegments.isNotEmpty && pathSegments.first == 'product') {
      pages.add(
        BeamPage(
          key: ValueKey('productDetail'),
          child: ProductDetailScreen(product: product),
        ),
      );

      if (pathSegments.length > 1 && pathSegments[1] == 'product-reviews') {
        pages.add(
          BeamPage(
            key: ValueKey('productReview'),
            child: ProductReviewScreen(),
          ),
        );
      }
    }

    return pages;
  }

  // @override
  // Widget builder(BuildContext context, BeamState navigator) {
  //   return const SizedBox.shrink();
  // }

  @override
  List<Pattern> get pathPatterns => [
    RouteNames.productDetail, // "/product"
    RouteNames.productReviews, // "/product/product-reviews"
  ];
}
