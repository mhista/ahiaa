import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../utils/constants/colors.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(PColors.white);

  void updateColor(Color color) {
    emit(color);
  }

  //   void removeColors(){
  //     emit([])
  //   }
}
// List<String> images, ImageType imageType, Color? color

class AppBarColorCubit extends Cubit<Color> {
  AppBarColorCubit() : super(PColors.transparent);

  void updateColor(Color color) {
    emit(color);
  }
}

// List<String> images, ImageType imageType, Color? color
