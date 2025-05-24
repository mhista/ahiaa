import 'package:ahiaa/core/dependencies/init_dependencies.dart';
import 'package:ahiaa/features/shop/home/presentation/cubit/palette/color_cubit.dart';
import 'package:ahiaa/features/shop/store/presentation/cubit/expand_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/constants/colors.dart';

class ScrollCubit extends Cubit<ScrollController> {
  ScrollCubit() : super(ScrollController()) {
    updateController(PColors.transparent);
    calculateOffset();
  }

  void updateController(Color color) {
    state.addListener(() {
      // PDeviceUtils.getAppBarHeight();
      if (state.position.atEdge) {
        serviceLocator<AppBarColorCubit>().updateColor(PColors.transparent);
        debugPrint('scrolling');
      } else {
        serviceLocator<AppBarColorCubit>().updateColor(PColors.light);
        debugPrint('scroll stopped');
      }
    });
  }

  void calculateOffset() {
    state.addListener(() {
      debugPrint(kToolbarHeight.toString());
      debugPrint(state.offset.toString());
      if (state.offset > 270) {
        serviceLocator<ExpandCubit>().makeTrue(true);
        serviceLocator<StopStartScroll>().makeTrue(false);
      } else {
        serviceLocator<ExpandCubit>().makeTrue(false);
        serviceLocator<StopStartScroll>().makeTrue(true);
      }
      debugPrint(serviceLocator<ExpandCubit>().state.toString());
    });
  }
}

// class 
// List<String> images, ImageType imageType, Color? color