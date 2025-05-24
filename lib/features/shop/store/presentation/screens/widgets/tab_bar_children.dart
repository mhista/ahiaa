import 'package:ahiaa/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/layouts/gid_layout.dart';
import '../../../../../../core/common/widgets/products/product_cards/product_card.dart';
import '../../../../../../core/dependencies/init_dependencies.dart';
import '../../cubit/expand_cubit.dart';
import '../../cubit/scroller/shop_scroller.dart';

class ShopTabBarChildren extends StatelessWidget {
  const ShopTabBarChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopStartScroll, bool>(
      builder: (context, state) {
        final isScrolled = context.watch<StopStartScroll>().state;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PSizes.spaceBtwItems - 2,
            vertical: PSizes.sm,
          ),
          child: GridLayout(
            controller: serviceLocator<ScrollCubit2>().state,
            itemCount: 4,
            vAxisSpacing: 2,
            hAxisSpacing: 10,
            mainAxisExtent: 215,
            physics: isScrolled ? null : BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return ProductContainer(height: 170, width: 180);
            },
          ),
        );
      },
    );
  }
}
