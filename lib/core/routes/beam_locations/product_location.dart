import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/product_detail.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_review/product_reviews.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

class ProductDetailLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable state,
  ) {
    final uri = state.routeInformation.uri;
    final pathSegments = uri.pathSegments;

    final pages = <BeamPage>[];

    if (pathSegments.isNotEmpty && pathSegments.first == 'product') {
      pages.add(
        BeamPage(key: ValueKey('productDetail'), child: ProductDetailScreen()),
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

  @override
  List<Pattern> get pathPatterns => [
    RouteNames.productDetail, // "/product"
    RouteNames.productReviews, // "/product/product-reviews"
  ];
}
