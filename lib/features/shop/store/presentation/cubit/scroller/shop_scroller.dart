import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/palette/color_cubit.dart';
import 'package:ahiaa/features/shop/store/presentation/cubit/expand_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/constants/colors.dart';

class ScrollCubit2 extends Cubit<ScrollController> {
  ScrollCubit2() : super(ScrollController()) {
    updateController(PColors.transparent);
    calculateOffset();
  }

  void updateController(Color color) {
    state.addListener(() {
      // PDeviceUtils.getAppBarHeight();
      if (state.offset < 0.1) {
        serviceLocator<StopStartScroll>().makeTrue(true);
      } else {
        serviceLocator<StopStartScroll>().makeTrue(false);
      }
    });
  }

  void calculateOffset() {
    state.addListener(() {
      debugPrint(kToolbarHeight.toString());
      debugPrint(state.offset.toString());
      if (state.offset > 270) {
        // serviceLocator<ExpandCubit>().makeTrue(true);
      } else {
        // serviceLocator<ExpandCubit>().makeTrue(false);
      }
      debugPrint(serviceLocator<ExpandCubit>().state.toString());
    });
  }
}

// class 
// List<String> images, ImageType imageType, Color? color

