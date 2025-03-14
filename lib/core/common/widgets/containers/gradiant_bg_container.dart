import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dependency/init_dependencies.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../features/shop/home/presentation/cubit/palette/color_cubit.dart';
import '../../../../features/shop/store/presentation/cubit/expand_cubit.dart';

class AnimatedPageSlide extends StatelessWidget {
  const AnimatedPageSlide({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        BlocBuilder<ExpandCubit, bool>(
          builder: (context, state) {
            return AnimatedContainer(
              // margin: serviceLocator<ExpandCubit>().state
              //     ? null
              //     : EdgeInsets.only(top: 320),
              // color: serviceLocator<ExpandCubit>().state
              //     ? isDark
              //         ? PColors.black
              //         : PColors.white
              //     : null,
              // alignment: serviceLocator<ExpandCubit>().state
              //     ? Alignment.center
              //     : Alignment.bottomCenter,
              // height: serviceLocator<ExpandCubit>().state
              //     ? PDeviceUtils.getScreenHeight(context)
              //     : PDeviceUtils.getScreenHeight(context) - 320,
              decoration: serviceLocator<ExpandCubit>().state
                  ? null
                  : BoxDecoration(
                      gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      colors: [
                        serviceLocator<ColorCubit>().state,
                        serviceLocator<ColorCubit>().state.withOpacity(0.8),
                        serviceLocator<ColorCubit>().state.withOpacity(0.7),
                        serviceLocator<ColorCubit>().state.withOpacity(0.6),
                        serviceLocator<ColorCubit>().state.withOpacity(0.5),
                        PColors.transparent,
                      ],
                    )),
              duration: Duration(milliseconds: 500),
            );
          },
        ),
        if (child != null) child!
      ],
    );
  }
}
