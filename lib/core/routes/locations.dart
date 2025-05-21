import 'package:ahiaa/core/routes/beam_locations/bottom_navigation_location.dart';
import 'package:ahiaa/core/routes/beam_locations/product_location.dart';
import 'package:ahiaa/core/routes/beam_locations/shop_location.dart';
import 'package:beamer/beamer.dart';

import 'beam_locations/cart_checkout_location.dart';
import 'beam_locations/auth_location.dart';
import 'beam_locations/product_upload_location.dart';

class BeamerLocations {
  static final beamLocations = <BeamLocation>[
    AuthLocation(),
    NavigationMenuLocator(),
    ShopLocation(),
    ProductDetailLocation(),
    CartCheckoutLocation(),
    ProductUploadLocation(),
  ];
}
