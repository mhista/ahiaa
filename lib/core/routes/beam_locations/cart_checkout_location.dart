import 'package:ahiaa/features/shop/cart/presentation/cart.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_detail/product_detail.dart';
import 'package:ahiaa/features/shop/product/presentation/screens/product_review/product_reviews.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../../../features/shop/checkout/checkout.dart';

class CartCheckoutLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable state,
  ) {
    final uri = state.routeInformation.uri;
    final pathSegments = uri.pathSegments;

    final pages = <BeamPage>[];
    if (pathSegments.isNotEmpty && pathSegments.first == 'checkout') {
      pages.add(BeamPage(key: ValueKey('checkout'), child: CheckoutScreen()));
    }

    if (pathSegments.isNotEmpty && pathSegments.first == 'cart') {
      pages.add(BeamPage(key: ValueKey('cart'), child: CartScreen()));
    }

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
    RouteNames.cart, // "/product"
    RouteNames.checkout, // "/product/product-reviews"
  ];
}
