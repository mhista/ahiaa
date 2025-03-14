import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteCubit extends Cubit<PaletteColor> {
  PaletteCubit() : super(PaletteColor(Colors.white, 2));

  Future<void> updatePalette(String image) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(image),
      size: Size(200, 100),
    );
    emit(generator.dominantColor ?? PaletteColor(Colors.white, 2));
  }
}
// List<String> images, ImageType imageType, Color? color

class ShopPaletteCubit extends Cubit<PaletteColor> {
  ShopPaletteCubit() : super(PaletteColor(Colors.white, 2));

  Future<void> updatePalette(String image) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      AssetImage(image),
      size: Size(200, 100),
    );
    emit(generator.dominantColor ?? PaletteColor(Colors.white, 2));
  }
}
// Li