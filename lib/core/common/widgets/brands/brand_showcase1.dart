// import 'package:ahiaa/core/routes/route_names.dart';
// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';

// import '../../../../utils/constants/sizes.dart';
// import '../containers/product_container.dart';
// import '../containers/rounded_container.dart';
// import 'brand_heading.dart';

// class BrandShowcaseWidget extends StatelessWidget {
//   const BrandShowcaseWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TRoundedContainer(
//           elevation: 2,
//           height: 500,
//           child: Column(children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: PSizes.spaceBtwSections,
//                   horizontal: PSizes.spaceBtwSections - 6),
//               // BRAND INFORMATION

//               child: BrandInfoWidget(
//                 onBrandImageTapped: () =>
//                     Beamer.of(context).beamToNamed(RouteNames.store),
//                 onFollowTapped: () {},
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   vertical: PSizes.spaceBtwSections,
//                   horizontal: PSizes.spaceBtwSections - 6),
//               child: HomeProductContainer(),
//             ),
//           ]),
//         ),
//         SizedBox(
//           height: PSizes.spaceBtwItems,
//         )
//       ],
//     );
//   }
// }
