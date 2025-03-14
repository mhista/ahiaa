import 'package:ahiaa/features/shop/store/presentation/screens/shop.dart';
import 'package:ahiaa/core/routes/route_names.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../features/shop/store/presentation/screens/shop_test.dart';

class ShopLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final pages = [
      BeamPage(
        key: ValueKey('shop'),
        child: ShopScreen(),
      ),
    ];
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [RouteNames.store];
}
