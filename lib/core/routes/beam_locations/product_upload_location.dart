import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../features/shop/category/presentation/screens/category_and_sub_select.dart';
import '../route_names.dart';

class ProductUploadLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable state,
  ) {
    final uri = state.routeInformation.uri;
    final location = uri.pathSegments;

    final pages = <BeamPage>[];
    if (location.length > 1 && location[1] == 'cat-select') {
      pages.add(
        const BeamPage(
          key: ValueKey('cat-select'),
          child: CategoryAndSubCategorySelect(),
        ),
      );
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [
    RouteNames.categorySelect, // "sell/cat-select"
  ];
}
